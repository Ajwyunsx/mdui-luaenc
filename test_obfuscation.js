const LuaObfuscator = require('./obfuscator.js');
const luaparse = require('luaparse');
const fs = require('fs');

global.luaparse = luaparse;

const source = `
print("Start")
local function factorial(n)
    if n == 0 then
        return 1
    else
        return n * factorial(n - 1)
    end
end

print("Factorial of 5 is: " .. factorial(5))

local t = { key = "value", [1] = 100 }
print("Table key: " .. t.key)
print("Table index 1: " .. t[1])

for i = 1, 3 do
    print("Loop iteration: " .. i)
end
print("End")
`;

try {
    const obfuscated = LuaObfuscator.obfuscate(source);
    fs.writeFileSync('debug.lua', obfuscated);
    console.log("Saved to debug.lua");
} catch (e) {
    console.error("Error:", e);
    process.exit(1);
}
