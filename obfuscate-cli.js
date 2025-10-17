// Simple Node.js CLI to run the Lua obfuscator and output result
const fs = require('fs');
const path = require('path');
const vm = require('vm');
const { validateLuaBalance } = require('./lua-balance-check');

// Load obfuscator source and evaluate in current context to define LuaObfuscator
const obfPath = path.join(__dirname, 'lua-obfuscator.js');
const obfCode = fs.readFileSync(obfPath, 'utf8');
vm.runInThisContext(obfCode, { filename: 'lua-obfuscator.js' });

// Resolve input/output from CLI args
const argInput = process.argv[2];
const argOutput = process.argv[3];
const inputFile = argInput ? path.resolve(__dirname, argInput) : path.join(__dirname, 'input.lua');
if (!fs.existsSync(inputFile)) {
  console.error('Input Lua file not found:', inputFile);
  process.exit(1);
}
const luaSource = fs.readFileSync(inputFile, 'utf8');

// Parse extra CLI options (from the 4th argument)
const extraArgs = process.argv.slice(4);
const cliOptions = {
  oneLine: false,
  validateBalance: true,
  safeMode: true,
  antiDebug: false,
  pcallProtection: false,
  junkCode: false,
  controlFlow: false,
  codeLogic: false,
  builtinAliasObfuscate: true,
  obfuscateFunctionDefinitions: true,
  functionWhitelist: [],
  exportGlobals: true,
  psychCompat: true,
  psychObfuscateEvents: true
};

for (const arg of extraArgs) {
  if (arg.startsWith('--one-line=')) {
    cliOptions.oneLine = arg.split('=')[1] !== 'false';
  } else if (arg.startsWith('--validate-balance=')) {
    cliOptions.validateBalance = arg.split('=')[1] !== 'false';
  } else if (arg.startsWith('--safe-mode=')) {
    cliOptions.safeMode = arg.split('=')[1] !== 'false';
  } else if (arg.startsWith('--anti-debug=')) {
    cliOptions.antiDebug = arg.split('=')[1] !== 'false';
  } else if (arg.startsWith('--pcall-protection=')) {
    cliOptions.pcallProtection = arg.split('=')[1] !== 'false';
  } else if (arg.startsWith('--junk-code=')) {
    cliOptions.junkCode = arg.split('=')[1] !== 'false';
  } else if (arg.startsWith('--control-flow=')) {
    cliOptions.controlFlow = arg.split('=')[1] !== 'false';
  } else if (arg.startsWith('--code-logic=')) {
    cliOptions.codeLogic = arg.split('=')[1] !== 'false';
  } else if (arg.startsWith('--builtin-alias-obfuscate=')) {
    cliOptions.builtinAliasObfuscate = arg.split('=')[1] !== 'false';
  } else if (arg.startsWith('--obfuscate-function-defs=')) {
    cliOptions.obfuscateFunctionDefinitions = arg.split('=')[1] !== 'false';
  } else if (arg.startsWith('--whitelist=')) {
    const raw = arg.split('=')[1] || '';
    cliOptions.functionWhitelist = raw.split(',').map(s => s.trim()).filter(Boolean);
  } else if (arg.startsWith('--export-globals=')) {
    cliOptions.exportGlobals = arg.split('=')[1] !== 'false';
  } else if (arg.startsWith('--psych-compat=')) {
    cliOptions.psychCompat = arg.split('=')[1] !== 'false';
  } else if (arg.startsWith('--psych-obf-events=')) {
    cliOptions.psychObfuscateEvents = arg.split('=')[1] !== 'false';
  }
}

const options = {
  safeMode: cliOptions.safeMode,
  oneLine: cliOptions.oneLine,
  antiDebug: cliOptions.antiDebug,
  pcallProtection: cliOptions.pcallProtection,
  junkCode: cliOptions.junkCode,
  controlFlow: cliOptions.controlFlow,
  codeLogic: cliOptions.codeLogic,
  builtinAliasObfuscate: cliOptions.builtinAliasObfuscate,
  obfuscateFunctionDefinitions: cliOptions.obfuscateFunctionDefinitions,
  functionWhitelist: cliOptions.functionWhitelist,
  exportGlobals: cliOptions.exportGlobals,
  psychCompat: cliOptions.psychCompat,
  psychObfuscateEvents: cliOptions.psychObfuscateEvents
};

function autoFixEndImbalance(code, oneLineMode) {
  // Simple tolerance: if fewer 'end' than needed, append to the tail
  const stats = validateLuaBalance(code);
  let fixed = code;
  let changed = false;
  if (!stats.balancedEnd && stats.opensEnd > stats.closesEnd) {
    const miss = stats.opensEnd - stats.closesEnd;
    const patch = Array(miss).fill(oneLineMode ? ' end; ' : '\nend').join('');
    fixed = fixed + patch;
    changed = true;
  }
  return { code: fixed, changed };
}

try {
  const obfuscator = new LuaObfuscator(options);
  let result = obfuscator.obfuscate(luaSource);

  // Auto-fix: if validation is enabled, fix simple end imbalance
  if (options.safeMode && cliOptions.validateBalance) {
    const { code: fixed, changed } = autoFixEndImbalance(result, !!options.oneLine);
    if (changed) result = fixed;
  }

  const outFile = argOutput ? path.resolve(__dirname, argOutput) : path.join(__dirname, 'output.lua');
  fs.writeFileSync(outFile, result, 'utf8');
  console.log('Obfuscation complete. Output written to', outFile);
  
  if (cliOptions.validateBalance) {
    const stats = validateLuaBalance(result);
    if (!stats.balancedEnd || !stats.balancedRepeat) {
      console.error('Lua block balance check failed:', stats.summaryString);
      const dbgPath = outFile + '.balance.txt';
      const lines = [];
      lines.push('[Summary] ' + stats.summaryString);
      const pick = (arr, label) => {
        lines.push(`\n[${label}] count=${arr.length}`);
        for (let i = 0; i < Math.min(arr.length, 20); i++) {
          const it = arr[i];
          lines.push(`pos=${it.pos} ctx=>>>${it.ctx}<<<`);
        }
      };
      pick(stats.details.functionTokens, 'function');
      pick(stats.details.doTokens, 'do');
      pick(stats.details.whileTokens, 'while');
      pick(stats.details.forTokens, 'for');
      pick(stats.details.ifTokens, 'if');
      pick(stats.details.endTokens, 'end');
      pick(stats.details.repeatTokens, 'repeat');
      pick(stats.details.untilTokens, 'until');
      try { fs.writeFileSync(dbgPath, lines.join('\n'), 'utf8'); console.error('Debug report saved to', dbgPath); } catch (e) {}
      process.exit(2);
    } else {
      console.log('Lua block balance OK:', stats.summaryString);
    }
  }
} catch (err) {
  console.error('Error during obfuscation:', err && err.stack || err);
  process.exit(1);
}