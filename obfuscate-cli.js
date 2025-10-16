// Simple Node.js CLI to run the Lua obfuscator and output result
const fs = require('fs');
const path = require('path');
const vm = require('vm');

// Load obfuscator source and evaluate in current context to define LuaObfuscator
const obfPath = path.join(__dirname, 'lua-obfuscator.js');
const obfCode = fs.readFileSync(obfPath, 'utf8');
vm.runInThisContext(obfCode, { filename: 'lua-obfuscator.js' });

// Read input file
const inputFile = process.argv[2] || path.join(__dirname, 'input.lua');
if (!fs.existsSync(inputFile)) {
  console.error('Input Lua file not found:', inputFile);
  process.exit(1);
}
const luaSource = fs.readFileSync(inputFile, 'utf8');

// Configure strong-but-safe options
const options = {
  controlFlow: true,
  codeLogic: true,
  localVar: true,
  globalVar: false,
  functionNameObfuscate: true,
  stringEncrypt: true,
  numberEncrypt: true,
  tableEncrypt: false,
  booleanObfuscate: true,
  nilObfuscate: true,
  gotoObfuscate: false,
  junkCode: true,
  oneLine: true
};

try {
  const obfuscator = new LuaObfuscator(options);
  const result = obfuscator.obfuscate(luaSource);
  const outFile = path.join(__dirname, 'output.lua');
  fs.writeFileSync(outFile, result, 'utf8');
  console.log('Obfuscation complete. Output written to', outFile);
} catch (err) {
  console.error('Error during obfuscation:', err && err.stack || err);
  process.exit(1);
}