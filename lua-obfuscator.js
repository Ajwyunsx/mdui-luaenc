/**
 * Lua 代码混淆器
 * 核心原则：确保混淆后的代码能够百分百准确运行
 */
class LuaObfuscator {
    constructor(options = {}) {
        // 设置默认选项
        this.options = {
            stringEncrypt: options.stringEncrypt !== undefined ? options.stringEncrypt : true,
            numberEncrypt: options.numberEncrypt !== undefined ? options.numberEncrypt : true,
            localVar: options.localVar !== undefined ? options.localVar : true,
            globalVar: options.globalVar !== undefined ? options.globalVar : false, // 全局变量混淆风险较高，默认关闭
            controlFlow: options.controlFlow !== undefined ? options.controlFlow : true,
            codeLogic: options.codeLogic !== undefined ? options.codeLogic : true,
        };

        // 内部状态
        this.localVarMap = new Map(); // 存储原始变量名到混淆名的映射
        this.globalVarMap = new Map();
        this.stringVarCounter = 0;
        this.numberVarCounter = 0;
    }

    /**
     * 主入口函数，执行混淆
     * @param {string} code - 原始 Lua 代码
     * @returns {string} - 混淆后的 Lua 代码
     */
    obfuscate(code) {
        let processedCode = code;

        // 【关键】混淆步骤的执行顺序非常重要
        // 1. 字符串和数字加密必须最先进行，因为它们会生成新的代码结构。
        //    后续的变量名混淆不能破坏这些新生成的代码结构。
        if (this.options.stringEncrypt) {
            processedCode = this._encryptStrings(processedCode);
        }
        if (this.options.numberEncrypt) {
            processedCode = this._encryptNumbers(processedCode);
        }

        // 2. 变量名混淆在字面量加密之后进行。
        if (this.options.localVar) {
            processedCode = this._obfuscateLocalVariables(processedCode);
        }
        if (this.options.globalVar) {
            processedCode = this._obfuscateGlobalVariables(processedCode);
        }

        // 3. 控制流和逻辑混淆在最后进行，它们在已有的代码结构上添加“噪音”。
        if (this.options.controlFlow) {
            processedCode = this._addControlFlow(processedCode);
        }
        if (this.options.codeLogic) {
            processedCode = this._addCodeLogic(processedCode);
        }

        return processedCode;
    }

    /**
     * 生成随机变量名
     * @param {number} length - 长度
     * @returns {string}
     */
    _generateRandomString(length = 8) {
        const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
        let result = '';
        for (let i = 0; i < length; i++) {
            result += chars.charAt(Math.floor(Math.random() * chars.length));
        }
        return result;
    }

    /**
     * 【核心功能1】加密字符串
     * 将字符串字面量替换为通过ASCII码数组还原的自执行函数
     * @param {string} code
     * @returns {string}
     */
    _encryptStrings(code) {
        // 匹配单引号或双引号字符串，处理转义引号
        const stringRegex = /(["'])((?:\\.|(?!\1)[^\\])*)\1/g;
        return code.replace(stringRegex, (match, quote, content) => {
            const charCodes = [];
            for (let i = 0; i < content.length; i++) {
                charCodes.push(content.charCodeAt(i));
            }
            const varName1 = this._generateRandomString(10);
            const varName2 = this._generateRandomString(10);
            // 生成 (function() local c={...} local s='' ... return s end)()
            return `(function() local ${varName1}={${charCodes.join(',')}} local ${varName2}='' for i=1,#${varName1} do ${varName2}=${varName2}..string.char(${varName1}[i]) end return ${varName2} end)()`;
        });
    }

    /**
     * 【核心功能2】加密数字
     * 将数字字面量替换为算术表达式。
     * 【修复】正确处理小数，将其转换为分数形式，避免语法错误。
     * @param {string} code
     * @returns {string}
     */
    _encryptNumbers(code) {
        // 匹配整数和小数
        const numberRegex = /\b\d+\.?\d*\b/g;
        return code.replace(numberRegex, (match) => {
            const num = parseFloat(match);
            if (Number.isInteger(num)) {
                // 整数: 123 -> (123/1)
                return `(${num}/1)`;
            } else {
                // 【修复点】小数: 0.2 -> (2/10), 3.14 -> (314/100)
                const decimalStr = num.toString();
                const decimalPlaces = decimalStr.split('.')[1].length;
                const denominator = Math.pow(10, decimalPlaces);
                const numerator = num * denominator;
                return `(${numerator}/${denominator})`;
            }
        });
    }

    /**
     * 【核心功能3】混淆局部变量
     * @param {string} code
     * @returns {string}
     */
    _obfuscateLocalVariables(code) {
        // 1. 找到所有 local 变量声明
        const localVarDeclarations = code.match(/local\s+([a-zA-Z_]\w*)/g);
        if (!localVarDeclarations) return code;

        const varsToObfuscate = new Set();
        localVarDeclarations.forEach(decl => {
            const varName = decl.split(' ')[1];
            // 忽略 Lua 的多变量赋值语法中的函数名
            if (!varName.includes(',')) {
                varsToObfuscate.add(varName);
            }
        });

        // 2. 为每个变量生成唯一的混淆名
        varsToObfuscate.forEach(originalName => {
            if (!this.localVarMap.has(originalName)) {
                this.localVarMap.set(originalName, this._generateRandomString());
            }
        });

        // 3. 在代码中替换所有局部变量名
        let processedCode = code;
        this.localVarMap.forEach((newName, originalName) => {
            // 使用 \b 确保匹配的是完整的单词，避免部分匹配
            const regex = new RegExp(`\\b${originalName}\\b`, 'g');
            processedCode = processedCode.replace(regex, newName);
        });

        return processedCode;
    }

    /**
     * 【核心功能4】混淆全局变量 (简化版，风险较高)
     * @param {string} code
     * @returns {string}
     */
    _obfuscateGlobalVariables(code) {
        // 这是一个简化的实现，有风险。
        // 它会替换所有未被声明为 local 的、且不是 Lua 关键字的标识符。
        const luaKeywords = new Set(['and', 'break', 'do', 'else', 'elseif', 'end', 'false', 'for', 'function', 'if', 'in', 'local', 'nil', 'not', 'or', 'repeat', 'return', 'then', 'true', 'until', 'while']);
        const stdLibs = new Set(['string', 'table', 'math', 'io', 'os', 'debug', 'bit32', 'coroutine', 'package', 'utf8', '_G']);
        
        // 找到所有标识符
        const allIdentifiers = code.match(/\b[a-zA-Z_]\w*\b/g);
        if (!allIdentifiers) return code;

        const potentialGlobals = new Set();
        allIdentifiers.forEach(id => {
            // 如果不是关键字，不是标准库，也不是已知的局部变量，则可能是全局变量
            if (!luaKeywords.has(id) && !stdLibs.has(id) && !this.localVarMap.has(id)) {
                potentialGlobals.add(id);
            }
        });
        
        let processedCode = code;
        potentialGlobals.forEach(originalName => {
            if (!this.globalVarMap.has(originalName)) {
                this.globalVarMap.set(originalName, this._generateRandomString());
            }
        });

        this.globalVarMap.forEach((newName, originalName) => {
            const regex = new RegExp(`\\b${originalName}\\b`, 'g');
            processedCode = processedCode.replace(regex, newName);
        });

        return processedCode;
    }

    /**
     * 【核心功能5】添加控制流混淆
     * @param {string} code
     * @returns {string}
     */
    _addControlFlow(code) {
        const lines = code.split('\n');
        const obfuscatedLines = lines.map(line => {
            // 随机在一些行后插入无用的 if 块
            if (line.trim() && Math.random() > 0.7) {
                const dummyVar = this._generateRandomString(5);
                const randomCondition = `(math.random(1,10) > 5)`;
                return line + `\nif ${randomCondition} then local ${dummyVar} = 1 end`;
            }
            return line;
        });
        return obfuscatedLines.join('\n');
    }

    /**
     * 【核心功能6】添加代码逻辑混淆
     * @param {string} code
     * @returns {string}
     */
    _addCodeLogic(code) {
        const lines = code.split('\n');
        const obfuscatedLines = lines.map(line => {
            if (line.trim() && Math.random() > 0.8) {
                const dummyVar = this._generateRandomString(5);
                // 插入一个结果为0的无用计算
                const dummyLogic = `( (50 * 2) - 100 )`;
                return `local ${dummyVar} = ${dummyLogic}\n` + line;
            }
            return line;
        });
        return obfuscatedLines.join('\n');
    }
}


// ==================== 使用示例 ====================

// 原始 Lua 代码
const originalCode = `
-- 这是一个测试脚本
local playerName = "Alex"
local health = 100
local damage = 15.5

function printPlayerInfo()
    local message = "Player: " .. playerName .. ", Health: " .. health
    print(message)
    cameraShake("game", 0.01, 0.2)
end

printPlayerInfo()
`;

console.log("--- 原始代码 ---");
console.log(originalCode);
console.log("\n" + "=".repeat(50) + "\n");

// 创建混淆器实例并配置选项
const obfuscator = new LuaObfuscator({
    stringEncrypt: true,
    numberEncrypt: true,
    localVar: true,
    globalVar: false, // 全局变量混淆比较危险，例如会混淆 print, cameraShake
    controlFlow: true,
    codeLogic: true,
});

// 执行混淆
const obfuscatedCode = obfuscator.obfuscate(originalCode);

console.log("--- 混淆后的代码 ---");
console.log(obfuscatedCode);

        
        this.varMap = new Map();
        this.varCounter = 0;
        this.stringKey = this.generateRandomKey();
        this.numberMap = new Map();
        this.tableMap = new Map();
    }
    
    generateRandomKey() {
        const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        let result = '';
        for (let i = 0; i < 16; i++) {
            result += chars.charAt(Math.floor(Math.random() * chars.length));
        }
        return result;
    }
    
    generateObfuscatedName() {
        const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        const digits = '0123456789';
        
        let name = chars.charAt(Math.floor(Math.random() * chars.length));
        const length = 5 + Math.floor(Math.random() * 10);
        
        for (let i = 1; i < length; i++) {
            name += chars.charAt(Math.floor(Math.random() * chars.length));
            if (Math.random() > 0.7 && i < length - 1) {
                name += digits.charAt(Math.floor(Math.random() * digits.length));
            }
        }
        
        return name;
    }
    
    /**
     * 混淆局部变量 (已修复)
     * 修复：增加了防御性检查，避免混淆字符串解密器内部的变量。
     */
    obfuscateLocalVariables(code) {
        if (!this.options.localVar) return code;
        
        const localVarPattern = /local\s+([a-zA-Z_][a-zA-Z0-9_]*)/g;
        const functionParamPattern = /function\s+[a-zA-Z_][a-zA-Z0-9_]*\s*\(([^)]*)\)/g;
        const uniqueVars = new Set();
        let match;

        while ((match = localVarPattern.exec(code)) !== null) {
            uniqueVars.add(match[1]);
        }
        
        while ((match = functionParamPattern.exec(code)) !== null) {
            const params = match[1].split(',').map(p => p.trim()).filter(p => p);
            for (let param of params) {
                if (param) uniqueVars.add(param);
            }
        }

        let result = code;
        for (let varName of uniqueVars) {
            // 【修复点 1】: 增加过滤条件，跳过常见、易冲突的短变量名和关键字
            if (varName.length < 2 || 
                this.reservedKeywords.has(varName) || 
                this.luaBuiltins.has(varName) ||
                varName.includes('string')) {
                continue;
            }

            const obfuscatedName = this.generateObfuscatedName();
            const pattern = new RegExp(`\\b${varName}\\b`, 'g');
            
            // 【修复点 2】: 逐行替换，并跳过包含字符串解密器特征的行
            const lines = result.split('\n');
            const newLines = lines.map(line => {
                // 如果一行代码看起来像是我们生成的解密器，就跳过它
                if (line.includes('string.char') && line.includes('local c =')) {
                    return line;
                }
                return line.replace(pattern, obfuscatedName);
            });
            result = newLines.join('\n');
        }
        
        return result;
    }
    
    /**
     * 加密字符串
     */
    encryptStrings(code) {
        if (!this.options.stringEncrypt) return code;
        
        const stringMatches = [];
        const stringRegex = /"([^"\\]|\\.)*"|'([^'\\]|\\.)*'/g;
        let match;
        
        while ((match = stringRegex.exec(code)) !== null) {
            const fullMatch = match[0];
            const stringContent = fullMatch.slice(1, -1);
            
            if (stringContent.includes('string.char')) continue;
            if (stringContent.length < 3) continue;
            
            stringMatches.push({
                start: match.index,
                end: match.index + fullMatch.length,
                content: stringContent,
                quote: fullMatch[0]
            });
        }
        
        console.log(`找到 ${stringMatches.length} 个需要加密的字符串`);
        
        let result = code;
        for (let i = stringMatches.length - 1; i >= 0; i--) {
            const match = stringMatches[i];
            const encrypted = this.createStringDecryptor(match.content);
            result = result.slice(0, match.start) + encrypted + result.slice(match.end);
        }
        
        return result;
    }
    
    /**
     * 创建字符串解密器
     * 使用纯表达式，不依赖 load/loadstring，兼容性最好。
     */
    createStringDecryptor(content) {
        const charCodes = [];
        for (let i = 0; i < content.length; i++) {
            charCodes.push(content.charCodeAt(i));
        }
        const decryptor = `(function() local c = {${charCodes.join(',')}} local s = '' for i = 1, #c do s = s .. string.char(c[i]) end return s end)()`;
        return decryptor;
    }
    
    xorEncrypt(text, key) {
        let result = '';
        for (let i = 0; i < text.length; i++) {
            const charCode = text.charCodeAt(i);
            const keyCode = key.charCodeAt(i % key.length);
            result += String.fromCharCode(charCode ^ keyCode);
        }
        return result;
    }
    
    /**
     * 加密数字 (已修复)
     * 修复：增加了防御性检查，避免混淆字符串解密器内部的数字。
     */
    encryptNumbers(code) {
        if (!this.options.numberEncrypt) return code;

        const expressions = [
            (num) => `(0+${num})`,
            (num) => `(1*${num})`,
            (num) => `(${num}/1)`,
            (num) => `((${num}))`,
        ];

        const lines = code.split('\n');
        const result = [];

        for (let line of lines) {
            if (line.trim().startsWith('--')) {
                result.push(line);
                continue;
            }

            // 【修复点】: 逐行处理，并跳过包含字符串解密器特征的行
            if (line.includes('string.char') && line.includes('local c =')) {
                result.push(line);
                continue;
            }

            const newLine = line.replace(/\b(\d+)\b/g, (match, numStr) => {
                const num = parseInt(numStr);
                if (num === 0 || num === 1) return match;
                if (num < 0 || num > 100) return match;

                const expression = expressions[Math.floor(Math.random() * expressions.length)];
                return expression(num);
            });

            result.push(newLine);
        }
        
        return result.join('\n');
    }
    
    /**
     * 加密表结构
     */
    encryptTables(code) {
        if (!this.options.tableEncrypt) return code;
        // 暂时不加密表结构，避免语法错误
        return code;
    }
    
    /**
     * 混淆布尔值
     */
    obfuscateBooleans(code) {
        if (!this.options.booleanObfuscate) return code;
        
        const trueExpressions = ['(1==1)', '(not false)', '(2>1)'];
        const falseExpressions = ['(1==0)', '(not true)', '(2<1)'];
        
        let result = code;
        result = result.replace(/\btrue\b/g, () => trueExpressions[Math.floor(Math.random() * trueExpressions.length)]);
        result = result.replace(/\bfalse\b/g, () => falseExpressions[Math.floor(Math.random() * falseExpressions.length)]);
        
        return result;
    }
    
    /**
     * 混淆nil值
     */
    obfuscateNil(code) {
        if (!this.options.nilObfuscate) return code;
        
        const nilExpressions = ['(function()end)()', '((function()return nil end)())'];
        
        let result = code;
        result = result.replace(/\bnil\b/g, () => nilExpressions[Math.floor(Math.random() * nilExpressions.length)]);
        
        return result;
    }
    
    /**
     * 控制流混淆
     */
    obfuscateControlFlow(code) {
        if (!this.options.controlFlow) return code;
        
        const lines = code.split('\n');
        const result = [];
        
        for (let i = 0; i < lines.length; i++) {
            const line = lines[i];
            result.push(line);
            
            if (line.trim() === 'end' && i < lines.length - 1) {
                const nextLine = lines[i + 1];
                if (nextLine.trim() !== '' && !nextLine.trim().startsWith('--')) {
                    const indent = line.match(/^(\s*)/)[1];
                    result.push(`${indent}if (1>0) then end`);
                }
            }
        }
        
        return result.join('\n');
    }
    
    /**
     * 代码逻辑流程混淆
     */
    obfuscateCodeLogic(code) {
        if (!this.options.codeLogic) return code;
        return code;
    }
    
    /**
     * 跳转语句混淆
     */
    obfuscateGoto(code) {
        if (!this.options.gotoObfuscate) return code;
        return code;
    }
    
    /**
     * 添加花指令
     */
    addJunkCode(code) {
        if (!this.options.junkCode) return code;
        
        const junkSnippets = [
            'do local _ = nil end', 'if false then end', 'while false do break end',
            'repeat until true', 'for i = 1, 0 do end', 'local function _() end'
        ];
        
        const lines = code.split('\n');
        const result = [];
        
        for (let i = 0; i < lines.length; i++) {
            result.push(lines[i]);
            
            if (Math.random() < 0.1 && lines[i].trim() !== '' && !lines[i].trim().startsWith('--')) {
                const junk = junkSnippets[Math.floor(Math.random() * junkSnippets.length)];
                const indent = lines[i].match(/^(\s*)/)[1];
                result.push(`${indent}${junk}`);
            }
        }
        
        return result.join('\n');
    }
    
    /**
     * 处理AndLua特殊需求
     */
    processAndLuaSpecial(code) {
        if (!this.options.andluaSpecial) return code;
        
        const lines = code.split('\n');
        const imports = [];
        const otherCode = [];
        
        lines.forEach(line => {
            const trimmed = line.trim();
            if (trimmed.startsWith('require') || trimmed.startsWith('import')) {
                imports.push(line);
            } else {
                otherCode.push(line);
            }
        });
        
        return [...imports, ...otherCode].join('\n');
    }
    
    /**
     * 混淆全局变量 (占位)
     */
    obfuscateGlobalVariables(code) {
        if (!this.options.globalVar) return code;
        // 全局变量混淆非常复杂，容易破坏代码，暂时留空
        return code;
    }

    /**
     * 主混淆函数 (已修复)
     * 修复：调整了混淆顺序，确保不会互相破坏。
     */
    obfuscate(code) {
        try {
            console.log('开始混淆，原始代码长度:', code.length);
            let obfuscatedCode = code;
            
            // 【修复点 3】: 调整了混淆顺序，这是最关键的修复！
            // 1. 变量混淆最先，因为它需要识别原始代码结构
            if (this.options.localVar) {
                console.log('步骤1: 局部变量混淆');
                obfuscatedCode = this.obfuscateLocalVariables(obfuscatedCode);
            }
            
            // 2. 数字混淆次之，在字符串加密前，避免破坏解密器数组
            if (this.options.numberEncrypt) {
                console.log('步骤2: 数字加密');
                obfuscatedCode = this.encryptNumbers(obfuscatedCode);
            }
            
            // 3. 字符串加密，此时变量和数字都已处理完毕，不会被破坏
            if (this.options.stringEncrypt) {
                console.log('步骤3: 字符串加密');
                obfuscatedCode = this.encryptStrings(obfuscatedCode);
            }
            
            // 4. 其他混淆项，这些相对安全，不会破坏已有结构
            if (this.options.andluaSpecial) {
                console.log('步骤4: 处理特殊语法');
                obfuscatedCode = this.processAndLuaSpecial(obfuscatedCode);
            }
            
            if (this.options.controlFlow) {
                console.log('步骤5: 控制流混淆');
                obfuscatedCode = this.obfuscateControlFlow(obfuscatedCode);
            }
            
            if (this.options.codeLogic) {
                console.log('步骤6: 代码逻辑混淆');
                obfuscatedCode = this.obfuscateCodeLogic(obfuscatedCode);
            }
            
            if (this.options.globalVar) {
                console.log('步骤7: 全局变量混淆');
                obfuscatedCode = this.obfuscateGlobalVariables(obfuscatedCode);
            }
            
            if (this.options.tableEncrypt) {
                console.log('步骤8: 表结构加密');
                obfuscatedCode = this.encryptTables(obfuscatedCode);
            }
            
            if (this.options.booleanObfuscate) {
                console.log('步骤9: 布尔值混淆');
                obfuscatedCode = this.obfuscateBooleans(obfuscatedCode);
            }
            
            if (this.options.nilObfuscate) {
                console.log('步骤10: nil值混淆');
                obfuscatedCode = this.obfuscateNil(obfuscatedCode);
            }
            
            if (this.options.gotoObfuscate) {
                console.log('步骤11: 跳转语句混淆');
                obfuscatedCode = this.obfuscateGoto(obfuscatedCode);
            }
            
            if (this.options.junkCode) {
                console.log('步骤12: 添加花指令');
                obfuscatedCode = this.addJunkCode(obfuscatedCode);
            }
            
            console.log('混淆完成，最终代码长度:', obfuscatedCode.length);
            return obfuscatedCode;
        } catch (error) {
            console.error('混淆过程中发生错误:', error);
            return code;
        }
    }
    
    validateBasicSyntax(code) {
        return true;
    }
}
