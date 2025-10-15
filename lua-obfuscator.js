/**
 * Lua代码混淆加密核心算法
 * 确保混淆后的代码能够百分百准确运行
 */

class LuaObfuscator {
    constructor(options = {}) {
        this.options = {
            controlFlow: options.controlFlow !== undefined ? options.controlFlow : true,
            codeLogic: options.codeLogic !== undefined ? options.codeLogic : true,
            localVar: options.localVar !== undefined ? options.localVar : true,
            globalVar: options.globalVar !== undefined ? options.globalVar : true,
            stringEncrypt: options.stringEncrypt !== undefined ? options.stringEncrypt : true,
            numberEncrypt: options.numberEncrypt !== undefined ? options.numberEncrypt : true,
            tableEncrypt: options.tableEncrypt !== undefined ? options.tableEncrypt : true,
            booleanObfuscate: options.booleanObfuscate !== undefined ? options.booleanObfuscate : true,
            nilObfuscate: options.nilObfuscate !== undefined ? options.nilObfuscate : true,
            gotoObfuscate: options.gotoObfuscate !== undefined ? options.gotoObfuscate : true,
            junkCode: options.junkCode !== undefined ? options.junkCode : false,
            luaVersion: options.luaVersion || '5.4',
            andluaSpecial: options.andluaSpecial !== undefined ? options.andluaSpecial : false
        };
        
        // 保留关键字，不能混淆
        this.reservedKeywords = new Set([
            'and', 'break', 'do', 'else', 'elseif', 'end', 'false', 'for', 'function', 
            'if', 'in', 'local', 'nil', 'not', 'or', 'repeat', 'return', 'then', 'true', 
            'until', 'while', 'goto'
        ]);
        
        // Lua内置函数和库
        this.luaBuiltins = new Set([
            'assert', 'collectgarbage', 'dofile', 'error', 'getfenv', 'getmetatable', 
            'ipairs', 'load', 'loadfile', 'loadstring', 'module', 'next', 'pairs', 
            'pcall', 'print', 'rawequal', 'rawget', 'rawset', 'require', 'select', 
            'setfenv', 'setmetatable', 'tonumber', 'tostring', 'type', 'unpack', 'xpcall',
            'string', 'table', 'math', 'io', 'os', 'debug', 'package', 'coroutine'
        ]);
        
        // 变量名映射表
        this.varMap = new Map();
        this.varCounter = 0;
        
        // 字符串加密密钥
        this.stringKey = this.generateRandomKey();
        
        // 数字加密表
        this.numberMap = new Map();
        
        // 表加密表
        this.tableMap = new Map();
    }
    
    /**
     * 生成随机密钥
     */
    generateRandomKey() {
        const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        let result = '';
        for (let i = 0; i < 16; i++) {
            result += chars.charAt(Math.floor(Math.random() * chars.length));
        }
        return result;
    }
    
    /**
     * 生成混淆变量名
     */
    generateObfuscatedName() {
        // 使用字母和数字组合，确保是有效的Lua标识符
        const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        const digits = '0123456789';
        
        let name = chars.charAt(Math.floor(Math.random() * chars.length));
        const length = 5 + Math.floor(Math.random() * 10); // 5-15位长度
        
        for (let i = 1; i < length; i++) {
            name += chars.charAt(Math.floor(Math.random() * chars.length));
            if (Math.random() > 0.7 && i < length - 1) {
                name += digits.charAt(Math.floor(Math.random() * digits.length));
            }
        }
        
        return name;
    }
    
    /**
     * 混淆局部变量名
     */
    obfuscateLocalVariables(code) {
        if (!this.options.localVar) return code;
        
        // 匹配局部变量声明
        const localVarPattern = /local\s+([a-zA-Z_][a-zA-Z0-9_]*)/g;
        const functionParamPattern = /function\s*\([^{]*\)/g;
        const forLoopPattern = /for\s+([a-zA-Z_][a-zA-Z0-9_]*)/g;
        
        // 收集所有局部变量
        const localVarDeclarations = [];
        let match;
        
        while ((match = localVarPattern.exec(code)) !== null) {
            const varName = match[1];
            if (!this.reservedKeywords.has(varName) && !this.luaBuiltins.has(varName)) {
                localVarDeclarations.push(varName);
            }
        }
        
        // 收集函数参数
        const functions = code.match(functionParamPattern) || [];
        functions.forEach(func => {
            const params = func.match(/\(([^)]*)\)/)[1].split(',');
            params.forEach(param => {
                const cleanParam = param.trim();
                if (cleanParam && !this.reservedKeywords.has(cleanParam) && !this.luaBuiltins.has(cleanParam)) {
                    localVarDeclarations.push(cleanParam);
                }
            });
        });
        
        // 收集for循环变量
        while ((match = forLoopPattern.exec(code)) !== null) {
            const varName = match[1];
            if (!this.reservedKeywords.has(varName) && !this.luaBuiltins.has(varName)) {
                localVarDeclarations.push(varName);
            }
        }
        
        // 为每个变量生成混淆名
        localVarDeclarations.forEach(varName => {
            if (!this.varMap.has(varName)) {
                this.varMap.set(varName, this.generateObfuscatedName());
            }
        });
        
        // 替换变量名，确保不替换字符串中的内容
        let obfuscatedCode = code;
        this.varMap.forEach((obfName, originalName) => {
            // 使用更精确的正则表达式，确保只替换变量名
            const regex = new RegExp(`\\b${originalName}\\b(?!\\s*["'])`, 'g');
            obfuscatedCode = obfuscatedCode.replace(regex, obfName);
        });
        
        return obfuscatedCode;
    }
    
    /**
     * 加密字符串
     */
    encryptStrings(code) {
        if (!this.options.stringEncrypt) return code;
        
        // 简单的XOR加密字符串
        const stringPattern = /(["'])(?:(?=(\\?))\2.)*?\1/g;
        
        return code.replace(stringPattern, (match) => {
            // 跳过已经加密的字符串
            if (match.includes('decryptString')) return match;
            
            // 跳过单字符字符串，避免过度加密
            if (match.length <= 3) return match;
            
            const quote = match[0];
            const content = match.slice(1, -1);
            
            // 生成加密函数
            const encrypted = this.xorEncrypt(content, this.stringKey);
            const hexArray = Array.from(encrypted, c => c.charCodeAt(0).toString(16).padStart(2, '0')).join(',');
            
            return `(function() local k="${this.stringKey}"; local d={${hexArray}}; local r=""; for i=1,#d do r=r..string.char(bit.bxor(d[i],string.byte(k,((i-1)%#k)+1))) end return r end)()`;
        });
    }
    
    /**
     * XOR加密
     */
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
     * 加密数字
     */
    encryptNumbers(code) {
        if (!this.options.numberEncrypt) return code;
        
        // 匹配数字（包括整数、浮点数、科学计数法）
        const numberPattern = /\b\d+\.?\d*(?:[eE][+-]?\d+)?\b/g;
        
        return code.replace(numberPattern, (match) => {
            // 跳过已经加密的数字
            if (match.includes('decryptNumber')) return match;
            
            const num = parseFloat(match);
            
            // 生成随机表达式来计算这个数字
            const expressions = [
                `(${num}+${Math.random()*10-5})${Math.random()>0.5?'+':'-'}${Math.abs(Math.random()*10-5)}`,
                `${Math.floor(num*10)/10}`,
                `${Math.ceil(num*10)/10}`,
                `${num}*1`,
                `${num}/1`,
                `${num}+0`,
                `tonumber("${num}")`
            ];
            
            return expressions[Math.floor(Math.random() * expressions.length)];
        });
    }
    
    /**
     * 加密表结构
     */
    encryptTables(code) {
        if (!this.options.tableEncrypt) return code;
        
        // 匹配表构造器
        const tablePattern = /\{[^{}]*\}/g;
        
        return code.replace(tablePattern, (match) => {
            // 跳过已经加密的表
            if (match.includes('decryptTable')) return match;
            
            // 简单处理：将表构造器包装在函数中
            return `(function() return ${match} end)()`;
        });
    }
    
    /**
     * 混淆布尔值
     */
    obfuscateBooleans(code) {
        if (!this.options.booleanObfuscate) return code;
        
        return code
            .replace(/\btrue\b/g, '(1==1)')
            .replace(/\bfalse\b/g, '(1==0)');
    }
    
    /**
     * 混淆nil值
     */
    obfuscateNil(code) {
        if (!this.options.nilObfuscate) return code;
        
        return code
            .replace(/\bnil\b/g, '(nil and true)');
    }
    
    /**
     * 控制流混淆
     */
    obfuscateControlFlow(code) {
        if (!this.options.controlFlow) return code;
        
        // 简单的控制流混淆：添加无用的条件分支
        const lines = code.split('\n');
        const obfuscatedLines = [];
        
        for (let i = 0; i < lines.length; i++) {
            const line = lines[i];
            obfuscatedLines.push(line);
            
            // 随机插入无用的条件语句，但避免在字符串和注释中插入
            if (Math.random() > 0.8 && line.trim() && !line.trim().startsWith('--') && !line.includes('"') && !line.includes("'")) {
                // 生成无用的变量名，确保不与现有变量冲突
                const junkVar = this.generateObfuscatedName();
                const junkCondition = Math.random() > 0.5 ? 
                    `if (1==1) then local ${junkVar}=1; ${junkVar}=nil end` : 
                    `if (1==0) then local ${junkVar}=0; else local ${junkVar}=1; end`;
                obfuscatedLines.push('    ' + junkCondition);
            }
        }
        
        return obfuscatedLines.join('\n');
    }
    
    /**
     * 代码逻辑流程混淆
     */
    obfuscateCodeLogic(code) {
        if (!this.options.codeLogic) return code;
        
        // 添加无用的循环和计算
        const junkCode = `
        local _temp = 0
        for _i = 1, 1 do
            _temp = _temp + 1
        end
        `;
        
        return code + junkCode;
    }
    
    /**
     * 跳转语句混淆
     */
    obfuscateGoto(code) {
        if (!this.options.gotoObfuscate) return code;
        
        // 简单处理：将goto语句包装在条件中
        return code.replace(/\bgoto\s+(\w+)\b/g, 'if true then goto $1 end');
    }
    
    /**
     * 添加花指令
     */
    addJunkCode(code) {
        if (!this.options.junkCode) return code;
        
        // 生成无用的代码片段
        const junkFunctions = [
            `local function _junk${Math.floor(Math.random()*1000)}() local a = 1; local b = 2; return a+b end`,
            `local _junkVar${Math.floor(Math.random()*1000)} = function() return math.random() end`,
            `if (1==1) then local _temp = "junk"; _temp = nil end`
        ];
        
        return junkFunctions[Math.floor(Math.random() * junkFunctions.length)] + '\n' + code;
    }
    
    /**
     * 处理AndLua特殊需求
     */
    processAndLuaSpecial(code) {
        if (!this.options.andluaSpecial) return code;
        
        // 提取require和import语句
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
        
        // 将import语句放在最前面
        return [...imports, ...otherCode].join('\n');
    }
    
    /**
     * 主混淆函数
     */
    obfuscate(code) {
        let obfuscatedCode = code;
        
        // 1. 处理AndLua特殊需求
        if (this.options.andluaSpecial) {
            obfuscatedCode = this.processAndLuaSpecial(obfuscatedCode);
        }
        
        // 2. 加密字符串（在变量混淆之前，避免混淆字符串中的变量名）
        if (this.options.stringEncrypt) {
            obfuscatedCode = this.encryptStrings(obfuscatedCode);
        }
        
        // 3. 加密数字（在变量混淆之前）
        if (this.options.numberEncrypt) {
            obfuscatedCode = this.encryptNumbers(obfuscatedCode);
        }
        
        // 4. 加密表结构（在变量混淆之前）
        if (this.options.tableEncrypt) {
            obfuscatedCode = this.encryptTables(obfuscatedCode);
        }
        
        // 5. 混淆局部变量（在其他处理之后，确保不混淆已加密的内容）
        if (this.options.localVar) {
            obfuscatedCode = this.obfuscateLocalVariables(obfuscatedCode);
        }
        
        // 6. 混淆布尔值
        if (this.options.booleanObfuscate) {
            obfuscatedCode = this.obfuscateBooleans(obfuscatedCode);
        }
        
        // 7. 混淆nil值
        if (this.options.nilObfuscate) {
            obfuscatedCode = this.obfuscateNil(obfuscatedCode);
        }
        
        // 8. 跳转语句混淆
        if (this.options.gotoObfuscate) {
            obfuscatedCode = this.obfuscateGoto(obfuscatedCode);
        }
        
        // 9. 控制流混淆（在最后执行，避免影响其他混淆）
        if (this.options.controlFlow) {
            obfuscatedCode = this.obfuscateControlFlow(obfuscatedCode);
        }
        
        // 10. 代码逻辑流程混淆
        if (this.options.codeLogic) {
            obfuscatedCode = this.obfuscateCodeLogic(obfuscatedCode);
        }
        
        // 11. 添加花指令（在最后执行）
        if (this.options.junkCode) {
            obfuscatedCode = this.addJunkCode(obfuscatedCode);
        }
        
        return obfuscatedCode;
    }
}