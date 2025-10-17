// Simple Node.js CLI to run the Lua obfuscator and output result
const fs = require('fs');
const path = require('path');
const vm = require('vm');

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

// Parse command line options
// (注释现在默认会被移除，不需要额外选项)

// Safe-by-default options for executable output
const options = {
  safeMode: true,
  stringEncrypt: true,
  stringEncryptLong: false,
  numberEncrypt: false, // 关闭整数包装以最大化兼容性（可按需开启）
  booleanObfuscate: true,
  nilObfuscate: true,
  oneLine: false
};

try {
  const obfuscator = new LuaObfuscator(options);
  const result = obfuscator.obfuscate(luaSource);
  const outFile = argOutput ? path.resolve(__dirname, argOutput) : path.join(__dirname, 'output.lua');
  fs.writeFileSync(outFile, result, 'utf8');
  console.log('Obfuscation complete. Output written to', outFile);
} catch (err) {
  console.error('Error during obfuscation:', err && err.stack || err);
  process.exit(1);
}