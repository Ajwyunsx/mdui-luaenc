const luaparse = require('luaparse');

const source = `
local function factorial(n)
    return 1
end
`;

const ast = luaparse.parse(source);
console.log(JSON.stringify(ast, null, 2));
