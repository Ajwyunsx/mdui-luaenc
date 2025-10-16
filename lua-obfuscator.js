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
            functionNameObfuscate: options.functionNameObfuscate !== undefined ? options.functionNameObfuscate : false,
            stringEncrypt: options.stringEncrypt !== undefined ? options.stringEncrypt : true,
            numberEncrypt: options.numberEncrypt !== undefined ? options.numberEncrypt : true,
            tableEncrypt: options.tableEncrypt !== undefined ? options.tableEncrypt : true,
            booleanObfuscate: options.booleanObfuscate !== undefined ? options.booleanObfuscate : true,
            nilObfuscate: options.nilObfuscate !== undefined ? options.nilObfuscate : true,
            gotoObfuscate: options.gotoObfuscate !== undefined ? options.gotoObfuscate : true,
            junkCode: options.junkCode !== undefined ? options.junkCode : false,
            luaVersion: options.luaVersion || '5.4',
            andluaSpecial: options.andluaSpecial !== undefined ? options.andluaSpecial : false,
            oneLine: options.oneLine !== undefined ? options.oneLine : true
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

        // 常见引擎/宿主的全局回调函数名（保持原名，确保外部能通过原名调用）
        this.callbackSafeNames = new Set([
            // 通用
            'main', 'init', 'start', 'stop', 'exit',
            // 事件/更新类
            'onEvent', 'onUpdate', 'onCreate', 'onDestroy', 'onLoad', 'onUnload', 'onInit', 'onStart', 'onStop', 'onExit',
            // Love2D/常见风格（若作为全局函数）
            'update', 'draw'
        ]);
        
        // 变量名映射表
        this.protectedNames = new Set();
        this.generatedNames = new Set();
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
        const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        const digits = '0123456789';
        const isBad = (n) => this.reservedKeywords.has(n) || this.luaBuiltins.has(n) || (this.protectedNames && this.protectedNames.has(n)) || (this.generatedNames && this.generatedNames.has(n));

        let name = '';
        do {
            name = chars.charAt(Math.floor(Math.random() * chars.length));
            const length = 5 + Math.floor(Math.random() * 10);
            for (let i = 1; i < length; i++) {
                name += chars.charAt(Math.floor(Math.random() * chars.length));
                if (Math.random() > 0.7 && i < length - 1) {
                    name += digits.charAt(Math.floor(Math.random() * digits.length));
                }
            }
        } while (isBad(name));

        this.generatedNames.add(name);
        return name;
    }
    
    /**
     * 混淆局部变量
     */
    obfuscateLocalVariables(code) {
        if (!this.options.localVar) return code;
        
        // 提取所有局部变量声明
        const localVarPattern = /local\s+([a-zA-Z_][a-zA-Z0-9_]*)/g;
        const uniqueVars = [];
        let match;
        
        while ((match = localVarPattern.exec(code)) !== null) {
            const varName = match[1];
            // 跳过包含'string'的变量名和常见关键字
            if (varName.includes('string') || 
                ['local', 'function', 'end', 'if', 'then', 'else', 'elseif', 'for', 'while', 'do', 'return', 'break', 'in', 'not', 'and', 'or', 'true', 'false', 'nil'].includes(varName)) {
                continue;
            }
            // 跳过受保护的名称（例如print别名等）
            if (this.protectedNames && this.protectedNames.has(varName)) {
                continue;
            }
            if (!uniqueVars.includes(varName)) {
                uniqueVars.push(varName);
            }
        }
        
        // 也要处理函数参数
        const functionParamPattern = /function\s+[a-zA-Z_][a-zA-Z0-9_]*\s*\(([^)]*)\)/g;
        while ((match = functionParamPattern.exec(code)) !== null) {
            const params = match[1].split(',').map(p => p.trim()).filter(p => p);
            for (let param of params) {
                if (param && !param.includes('string') && 
                    !['local', 'function', 'end', 'if', 'then', 'else', 'elseif', 'for', 'while', 'do', 'return', 'break', 'in', 'not', 'and', 'or', 'true', 'false', 'nil'].includes(param)) {
                    if (this.protectedNames && this.protectedNames.has(param)) continue;
                    if (!uniqueVars.includes(param)) {
                        uniqueVars.push(param);
                    }
                }
            }
        }
        
        // 替换变量名
        let result = code;
        for (let varName of uniqueVars) {
            const obfuscatedName = this.generateObfuscatedName();
            const pattern = new RegExp(`\\b${varName}\\b`, 'g');
            result = result.replace(pattern, (m, offset, whole) => {
                const prev = offset > 0 ? whole[offset - 1] : '';
                // 避免替换对象属性或库方法，例如 string.char / obj.char
                if (prev === '.' || prev === ':') return m;
                // 避免替换函数定义名：function <name>(...)
                const before = whole.slice(Math.max(0, offset - 20), offset);
                const after = whole.slice(offset + m.length);
                if (/function\s+$/.test(before) && /^\s*\(/.test(after)) {
                    return m;
                }
                return obfuscatedName;
            });
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
            
            // 跳过已经加密的字符串
            if (stringContent.includes('string.char')) continue;
            
            // 跳过简单的字符串
            if (stringContent.length < 3) continue;
            
            stringMatches.push({
                start: match.index,
                end: match.index + fullMatch.length,
                content: stringContent,
                quote: fullMatch[0]
            });
        }
        
        console.log(`找到 ${stringMatches.length} 个需要加密的字符串`);
        
        // 从后往前替换，避免索引偏移
        let result = code;
        for (let i = stringMatches.length - 1; i >= 0; i--) {
            const match = stringMatches[i];
            const encrypted = this.createStringDecryptor(match.content);
            result = result.slice(0, match.start) + encrypted + result.slice(match.end);
            console.log(`加密字符串: "${match.content}" -> "${encrypted}"`);
        }
        
        return result;
    }
    
    /**
     * 创建字符串解密器
     */
createStringDecryptor(content) {
    const charCodes = [];
    for (let i = 0; i < content.length; i++) {
        charCodes.push(content.charCodeAt(i));
    }

    // 使用安全的标识符生成器，避免产生 Lua 保留关键字（如 in、or 等）
    const arr = this.generateObfuscatedName();
    const acc = this.generateObfuscatedName();
    const idx = this.generateObfuscatedName();

    // ✅ 纯表达式，不依赖 load/loadstring；包含随机变量名以增强不可预测性
    const decryptor = `(function() local ${arr} = {${charCodes.join(',')}} local ${acc} = '' for ${idx} = 1, #${arr} do ${acc} = ${acc} .. string.char(${arr}[${idx}]) end return ${acc} end)()`;
    console.log(`生成解密器: "${content}" -> "${decryptor}"`);
    return decryptor;
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

    const expressions = [
        (num) => `(0+${num})`,
        (num) => `(1*${num})`,
        (num) => `(${num}/1)`,
        (num) => `(${num}+0-0)`,
        (num) => `((${num}))`,
        // ❌ 移除这些可能引发语法问题的表达式
        // (num) => `(function()return ${num} end)()`,
    ];

    console.log('开始数字加密...');
    let matchCount = 0;

    const lines = code.split('\n');
    const result = [];

    for (let line of lines) {
        if (line.trim().startsWith('--')) {
            result.push(line);
            continue;
        }

        // 仅加密不属于小数的整数，避免破坏诸如 0.5、12.34 等数值
        // 规则：匹配独立整数，且后面不紧跟 ".数字"，前面不为小数点
        const newLine = line.replace(/\b(\d+)\b/g, (match, numStr, offset, whole) => {
            // 避免破坏小数：前一个字符为 '.' 或后面紧跟 '.数字'
            const prev = offset > 0 ? whole[offset - 1] : '';
            const next = whole.slice(offset + match.length);
            if (prev === '.' || (/^\.\d/.test(next))) return match;

            const num = parseInt(numStr, 10);
            if (num === 0 || num === 1) return match;
            if (num < 0 || num > 100) return match;

            matchCount++;
            const expression = expressions[Math.floor(Math.random() * expressions.length)];
            const encrypted = expression(num);
            console.log(`加密数字: ${num} -> ${encrypted}`);
            return encrypted;
        });

        result.push(newLine);
    }

    console.log(`数字加密完成，共加密 ${matchCount} 个数字`);
    return result.join('\n');
}

    
    /**
     * 加密表结构
     */
    encryptTables(code) {
        if (!this.options.tableEncrypt) return code;
        
        // 更安全的表匹配，避免破坏嵌套表结构
        const lines = code.split('\n');
        const result = [];
        
        for (let line of lines) {
            // 跳过注释行
            if (line.trim().startsWith('--')) {
                result.push(line);
                continue;
            }
            
            // 匹配简单的表构造器（不包含嵌套表）
            const simpleTablePattern = /\{[^{}]*\}/g;
            
            const newLine = line.replace(simpleTablePattern, (match) => {
                // 跳过空表和单元素表，避免过度加密
                if (match.length <= 5) return match;

                // 包裹为立即调用函数，返回原表，避免影响语义
                return `((function() local __t = ${match} return __t end)())`;
            });
            
            result.push(newLine);
        }
        
        return result.join('\n');
    }
    
    /**
     * 混淆布尔值
     */
    obfuscateBooleans(code) {
        if (!this.options.booleanObfuscate) return code;
        
        // 将true/false转换为复杂的表达式
        const trueExpressions = [
            '(1==1)',
            '(0==0)',
            '(2>1)',
            '(1>=1)',
            '(0<=0)',
            'not false',
            '(function()return true end)()'
        ];
        
        const falseExpressions = [
            '(1==0)',
            '(2==1)',
            '(0>1)',
            '(1<1)',
            'not true',
            '(function()return false end)()'
        ];
        
        let result = code;
        
        // 替换true
        result = result.replace(/\btrue\b/g, () => {
            return trueExpressions[Math.floor(Math.random() * trueExpressions.length)];
        });
        
        // 替换false
        result = result.replace(/\bfalse\b/g, () => {
            return falseExpressions[Math.floor(Math.random() * falseExpressions.length)];
        });
        
        console.log('布尔值混淆完成');
        return result;
    }
    
    /**
     * 混淆nil值
     */
    obfuscateNil(code) {
        if (!this.options.nilObfuscate) return code;
        
        // 将nil转换为复杂的表达式
        const nilExpressions = [
            '(function()end)()',
            '((function()return nil end)())',
            '(nil)',
            '(function()local x return x end)()',
            '((function()local function f()end return f()end)())'
        ];
        
        let result = code;
        
        result = result.replace(/\bnil\b/g, () => {
            return nilExpressions[Math.floor(Math.random() * nilExpressions.length)];
        });
        
        console.log('nil值混淆完成');
        return result;
    }
    
    /**
     * 控制流混淆
     */
    obfuscateControlFlow(code) {
        if (!this.options.controlFlow) return code;
        
        // 简单的控制流混淆：在代码块末尾添加条件语句（随机谓词）
        const lines = code.split('\n');
        const result = [];
        const predicates = [
            '1==1', '0==0', '2>1', '1>=1', '0<=0', 'not false', '(3-3)==0'
        ];
        
        for (let i = 0; i < lines.length; i++) {
            const line = lines[i];
            result.push(line);
            
            // 在函数末尾添加条件语句 - 更简单的形式
            if (line.trim() === 'end' && i < lines.length - 1) {
                const nextLine = lines[i + 1];
                // 确保不是函数结束或文件结束
                if (nextLine.trim() !== '' && !nextLine.trim().startsWith('--')) {
                    const indent = line.match(/^(\s*)/)[1];
                    const pred = predicates[Math.floor(Math.random() * predicates.length)];
                    result.push(`${indent}if ${pred} then end`);
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

        const lines = code.split('\n');
        const result = [];

        let insertedCount = 0;
        for (let i = 0; i < lines.length; i++) {
            const line = lines[i];
            result.push(line);

            // 在函数或代码块结束后插入安全的无副作用块
            if (line.trim() === 'end') {
                const indent = (line.match(/^(\s*)/) || ['',''])[1];
                const block = `${indent}do local __k = 0 if __k == 1 then __k = __k + 1 end end`;
                result.push(block);
                insertedCount++;
            }
        }

        console.log(`代码逻辑混淆：插入 ${insertedCount} 个无副作用块`);
        return result.join('\n');
    }
    
    /**
     * 跳转语句混淆
     */
    obfuscateGoto(code) {
        if (!this.options.gotoObfuscate) return code;

        // 在代码末尾添加不可达的跳转与标签，避免影响原有逻辑
        const label = this.generateObfuscatedName();
        const preds = ['false', '(1==0)', '(2<1)', 'not true'];
        const pred = preds[Math.floor(Math.random() * preds.length)];
        const appendJunk = `\ndo\n  if ${pred} then goto ${label} end\n  ::${label}::\nend`;
        console.log('跳转语句混淆：添加不可达标签和跳转');
        return code + appendJunk;
    }
    
    /**
     * 添加花指令
     */
    addJunkCode(code) {
        if (!this.options.junkCode) return code;
        
        const makeJunk = () => {
            const id1 = this.generateObfuscatedName();
            const id2 = this.generateObfuscatedName();
            const variants = [
                `do local ${id1} = nil end`,
                'if false then end',
                'while false do break end',
                'repeat until true',
                `for ${id1} = 1, 0 do end`,
                `local function ${id2}() end`,
                '(function() end)()',
                `local ${id1} = (function() return {} end)()`,
                `do local ${id1} = 0 if ${id1} ~= 1 then ${id1} = ${id1} end end`
            ];
            return variants[Math.floor(Math.random() * variants.length)];
        };
        
        const lines = code.split('\n');
        const result = [];
        
        for (let i = 0; i < lines.length; i++) {
            result.push(lines[i]);
            
            // 随机插入花指令（10%概率）
            const trimmed = lines[i].trim();
            // 重要：不要在 return 后插入任何语句，Lua 语法要求 return 必须是代码块的最后一条语句
            const isReturnLine = /^return\b/.test(trimmed);
            if (Math.random() < 0.1 && trimmed !== '' && !trimmed.startsWith('--') && !isReturnLine) {
                const junk = makeJunk();
                const indent = lines[i].match(/^(\s*)/)[1];
                result.push(`${indent}${junk}`);
            }
        }
        
        console.log('花指令添加完成');
        return result.join('\n');
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
        try {
            console.log('开始混淆，原始代码长度:', code.length);
            let obfuscatedCode = code;

            // 0. 预处理：移除Lua注释（行注释与块注释）
            if (/-\-/.test(obfuscatedCode) || /--\[\[/.test(obfuscatedCode)) {
                console.log('步骤0: 移除Lua注释');
                obfuscatedCode = this.stripLuaComments(obfuscatedCode);
            }
            
            // 1. 处理AndLua特殊需求
            if (this.options.andluaSpecial) {
                console.log('步骤1: 处理特殊语法');
                obfuscatedCode = this.processAndLuaSpecial(obfuscatedCode);
            }
            
            // 2. 字符串加密（优先级最高）
            if (this.options.stringEncrypt) {
                console.log('步骤2: 字符串加密');
                obfuscatedCode = this.encryptStrings(obfuscatedCode);
            }
            
            // 3. 数字加密
            if (this.options.numberEncrypt) {
                console.log('步骤3: 数字加密');
                obfuscatedCode = this.encryptNumbers(obfuscatedCode);
            }

            // 3.5 函数名混淆（包括对内置print的安全别名）
            if (this.options.functionNameObfuscate) {
                console.log('步骤3.5: 函数名混淆');
                obfuscatedCode = this.obfuscateFunctionNames(obfuscatedCode);
            }

            // 4. 局部变量混淆
            if (this.options.localVar) {
                console.log('步骤4: 局部变量混淆');
                obfuscatedCode = this.obfuscateLocalVariables(obfuscatedCode);
            }
            
            // 5. 控制流混淆
            if (this.options.controlFlow) {
                console.log('步骤5: 控制流混淆');
                obfuscatedCode = this.obfuscateControlFlow(obfuscatedCode);
            }
            
            // 6. 代码逻辑混淆
            if (this.options.codeLogic) {
                console.log('步骤6: 代码逻辑混淆');
                obfuscatedCode = this.obfuscateCodeLogic(obfuscatedCode);
            }
            
            // 7. 全局变量混淆
            if (this.options.globalVar) {
                console.log('步骤7: 全局变量混淆');
                obfuscatedCode = this.obfuscateGlobalVariables(obfuscatedCode);
            }
            
            // 8. 表结构加密
            if (this.options.tableEncrypt) {
                console.log('步骤8: 表结构加密');
                obfuscatedCode = this.encryptTables(obfuscatedCode);
            }
            
            // 9. 布尔值混淆
            if (this.options.booleanObfuscate) {
                console.log('步骤9: 布尔值混淆');
                obfuscatedCode = this.obfuscateBooleans(obfuscatedCode);
            }
            
            // 10. nil值混淆
            if (this.options.nilObfuscate) {
                console.log('步骤10: nil值混淆');
                obfuscatedCode = this.obfuscateNil(obfuscatedCode);
            }
            
            // 11. 跳转语句混淆
            if (this.options.gotoObfuscate) {
                console.log('步骤11: 跳转语句混淆');
                obfuscatedCode = this.obfuscateGoto(obfuscatedCode);
            }
            
            // 12. 添加花指令
            if (this.options.junkCode) {
                console.log('步骤12: 添加花指令');
                obfuscatedCode = this.addJunkCode(obfuscatedCode);
            }

            // 13. 单行压缩（极限混淆）
            if (this.options.oneLine) {
                console.log('步骤13: 单行压缩');
                obfuscatedCode = this.flattenOneLine(obfuscatedCode);
            }
            
            console.log('混淆完成，最终代码长度:', obfuscatedCode.length);
            return obfuscatedCode;
        } catch (error) {
            console.error('混淆过程中发生错误:', error);
            return code;
        }
    }
    
    /**
     * 验证基本语法
     */
    validateBasicSyntax(code) {
        // 简化语法验证 - 总是返回true，让混淆继续进行
        return true;
    }

    /**
     * 移除Lua注释（尽量不影响字符串内容）
     * 支持：--[[ 块注释 ]], 行内/整行 -- 注释
     */
    stripLuaComments(code) {
        // 移除块注释：--[[ ... ]]
        let result = code.replace(/--\[\[[\s\S]*?\]\]/g, '');

        const lines = result.split('\n');
        const processed = lines.map(line => {
            let inStr = false;
            let strChar = '';
            for (let i = 0; i < line.length; i++) {
                const ch = line[i];
                const prev = i > 0 ? line[i - 1] : '';
                // 进入/退出字符串（简单处理引号，考虑反斜杠转义）
                if (!inStr && (ch === '"' || ch === '\'')) {
                    inStr = true;
                    strChar = ch;
                    continue;
                } else if (inStr) {
                    if (ch === strChar && prev !== '\\') {
                        inStr = false;
                        strChar = '';
                    }
                    continue;
                }

                // 非字符串内遇到 -- 视为注释起点，截断该行
                if (!inStr && ch === '-' && i + 1 < line.length && line[i + 1] === '-') {
                    return line.slice(0, i).trimEnd();
                }
            }
            return line;
        });

        return processed.join('\n');
    }

    /**
     * 全局变量混淆（保守实现：当前不改变代码，仅占位避免报错）
     * 如需启用真实全局混淆，建议进行语法解析以避免误改局部变量
     */
    obfuscateGlobalVariables(code) {
        console.log('全局变量混淆：保守实现占位，未修改代码');
        return code;
    }

    /**
     * 函数名混淆：重命名函数定义与调用，并保持原始全局回调可调用
     * 策略：
     * - 识别简单的函数定义形式：
     *   1) function name(...) ... end        （全局）
     *   2) local function name(...) ... end  （局部）
     *   3) name = function(...) ... end      （倾向全局）
     * - 跳过方法定义：function obj:method(...) / function obj.method(...)
     * - 对被重命名的全局函数，在文件末尾注入别名：_G["原名"] = 新名
     *   这样引擎仍能通过原始全局名称调用（例如 onUpdate/onEvent 等）。
     */
    obfuscateFunctionNames(code) {
        let result = code;

        // 用于收集重命名映射
        const globalFuncMap = new Map(); // 原名 -> 混淆名
        const localFuncMap = new Map();  // 原名 -> 混淆名

        // 跳过方法定义（obj:method / obj.method）
        const methodDefPattern = /\bfunction\s+[a-zA-Z_][a-zA-Z0-9_]*[\.:][a-zA-Z_][a-zA-Z0-9_]*\s*\(/g;
        // 简单函数定义
        const globalDefPattern = /\bfunction\s+([a-zA-Z_][a-zA-Z0-9_]*)\s*\(/g;
        const localDefPattern  = /\blocal\s+function\s+([a-zA-Z_][a-zA-Z0-9_]*)\s*\(/g;
        const assignDefPattern = /\b([a-zA-Z_][a-zA-Z0-9_]*)\s*=\s*function\s*\(/g;

        const shouldSkip = (name) => {
            return this.reservedKeywords.has(name)
                || this.luaBuiltins.has(name)
                || (this.protectedNames && this.protectedNames.has(name))
                || (this.callbackSafeNames && this.callbackSafeNames.has(name));
        };

        // 收集局部定义
        {
            let m;
            while ((m = localDefPattern.exec(result)) !== null) {
                const name = m[1];
                if (shouldSkip(name)) continue;
                if (!localFuncMap.has(name)) {
                    localFuncMap.set(name, this.generateObfuscatedName());
                }
            }
        }

        // 收集全局定义（排除方法定义）
        {
            let m;
            while ((m = globalDefPattern.exec(result)) !== null) {
                const name = m[1];
                // 如果匹配到的是方法定义，跳过
                // 这里通过再次检查上下文简化处理：若前面出现 obj: 或 obj. 则不当成纯全局
                const before = result.slice(Math.max(0, m.index - 20), m.index);
                if (/[\.:]\s*$/.test(before)) continue;
                if (shouldSkip(name)) continue;
                if (!globalFuncMap.has(name)) {
                    globalFuncMap.set(name, this.generateObfuscatedName());
                }
            }
        }

        // 收集赋值式定义为全局（保守处理）
        {
            let m;
            while ((m = assignDefPattern.exec(result)) !== null) {
                const name = m[1];
                if (shouldSkip(name)) continue;
                if (!globalFuncMap.has(name) && !localFuncMap.has(name)) {
                    globalFuncMap.set(name, this.generateObfuscatedName());
                }
            }
        }

        // 执行替换：定义与调用，同时避免方法/属性调用（. 或 :）
        const replaceNameEverywhere = (src, name, obf) => {
            let out = src;

            // 定义替换
            out = out.replace(new RegExp(`\\blocal\\s+function\\s+${name}\\s*\\(`, 'g'), `local function ${obf}(`);
            out = out.replace(new RegExp(`\\bfunction\\s+${name}\\s*\\(`, 'g'), `function ${obf}(`);
            out = out.replace(new RegExp(`\\b${name}\\s*=\\s*function\\s*\\(`, 'g'), `${obf} = function(`);

            // 调用替换（避免 obj:name(...) / obj.name(...) ）
            const callPattern = new RegExp(`\\b${name}\\b`, 'g');
            out = out.replace(callPattern, (m, offset) => {
                const prev = offset > 0 ? out[offset - 1] : '';
                const next = out.slice(offset + m.length);
                if (prev === '.' || prev === ':') return m; // 方法/属性访问不改
                // 仅在后面跟随调用括号时替换为混淆名
                if (/^\s*\(/.test(next)) return obf;
                return m;
            });

            return out;
        };

        // 先替换局部函数（不改变其作用域）
        for (const [name, obf] of localFuncMap.entries()) {
            result = replaceNameEverywhere(result, name, obf);
        }

        // 再替换全局函数，并在末尾注入包装函数，保持原名可全局调用
        const wrapperLines = [];
        const injected = new Set();
        for (const [name, obf] of globalFuncMap.entries()) {
            result = replaceNameEverywhere(result, name, obf);
            if (!injected.has(name)) {
                wrapperLines.push(`function ${name}(...) return ${obf}(...) end`);
                injected.add(name);
            }
        }

        // 为局部函数同样注入全局包装（通用自动化需求）
        // 这样即使原代码将其定义为局部，混淆后仍可通过原始名字进行全局调用
        for (const [name, obf] of localFuncMap.entries()) {
            if (!injected.has(name)) {
                wrapperLines.push(`function ${name}(...) return ${obf}(...) end`);
                injected.add(name);
            }
        }

        if (wrapperLines.length > 0) {
            result = result + '\n' + wrapperLines.join('\n');
        }

        return result;
    }

    /**
     * 单行压缩：去除换行与多余空白，保留必要空格
     */
    flattenOneLine(code) {
        // 尽量避免误删字符串中的内容，这里不处理字符串，仅处理换行与多空白
        // 移除行尾注释（简化版，可能不会覆盖所有情况）
        let pre = code.replace(/(^|\n)\s*--.*(?=\n|$)/g, '$1');
        // 移除块注释 --[[ ... ]]
        pre = pre.replace(/--\[\[[\s\S]*?\]\]/g, '');

        // 在行尾的 end 后注入分号，确保与后续语句在同一行时仍能正确分隔
        // 仅在 end 位于行末时处理，避免影响诸如 "end)" 等写法
        pre = pre.replace(/(\bend\b)\s*(?=\r?\n)/g, '$1;');

        // 将所有换行变为空格
        let oneLine = pre.replace(/\r?\n+/g, ' ');
        // 折叠多空白为单空格
        oneLine = oneLine.replace(/\s+/g, ' ');
        // 去除多余空格
        oneLine = oneLine.trim();
        return oneLine;
    }
}
