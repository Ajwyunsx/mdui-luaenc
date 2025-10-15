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

