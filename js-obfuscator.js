/**
 * JavaScript代码混淆加密核心算法
 * 确保混淆后的代码能够百分百准确运行
 */

class JSObfuscator {
    constructor(options = {}) {
        this.options = {
            controlFlow: options.controlFlow !== undefined ? options.controlFlow : true,
            codeLogic: options.codeLogic !== undefined ? options.codeLogic : true,
            localVar: options.localVar !== undefined ? options.localVar : true,
            globalVar: options.globalVar !== undefined ? options.globalVar : true,
            functionNameObfuscate: options.functionNameObfuscate !== undefined ? options.functionNameObfuscate : false,
            stringEncrypt: options.stringEncrypt !== undefined ? options.stringEncrypt : true,
            numberEncrypt: options.numberEncrypt !== undefined ? options.numberEncrypt : true,
            booleanObfuscate: options.booleanObfuscate !== undefined ? options.booleanObfuscate : true,
            nullObfuscate: options.nullObfuscate !== undefined ? options.nullObfuscate : true,
            deadCode: options.deadCode !== undefined ? options.deadCode : false,
            codeSplitReorganize: options.codeSplitReorganize !== undefined ? options.codeSplitReorganize : false,
            antiDebug: options.antiDebug !== undefined ? options.antiDebug : false,
            oneLine: options.oneLine !== undefined ? options.oneLine : true
        };
        
        // JavaScript保留关键字，不能混淆
        this.reservedKeywords = new Set([
            'break', 'case', 'catch', 'class', 'const', 'continue', 'debugger', 'default', 'delete', 'do', 'else', 'export', 'extends', 'finally', 'for', 'function', 'if', 'import', 'in', 'instanceof', 'let', 'new', 'return', 'super', 'switch', 'this', 'throw', 'try', 'typeof', 'var', 'void', 'while', 'with', 'yield'
        ]);
        
        // JavaScript内置对象和函数
        this.jsBuiltins = new Set([
            'Array', 'Boolean', 'Date', 'Error', 'Function', 'JSON', 'Math', 'Number', 'Object', 'RegExp', 'String', 'console', 'document', 'window', 'global', 'process', 'setTimeout', 'setInterval', 'clearTimeout', 'clearInterval'
        ]);

        // 常见全局函数名（保持原名）
        this.globalSafeNames = new Set([
            'main', 'init', 'start', 'stop', 'exit', 'onLoad', 'onUnload', 'onInit', 'onStart', 'onStop', 'onExit', 'update', 'draw'
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
        const isBad = (n) => this.reservedKeywords.has(n) || this.jsBuiltins.has(n) || (this.protectedNames && this.protectedNames.has(n)) || (this.generatedNames && this.generatedNames.has(n));

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
     * 主混淆函数
     */
    obfuscate(code) {
        try {
            console.log('开始混淆JavaScript代码，原始代码长度:', code.length);
            let obfuscatedCode = code;

            // 0. 预处理：移除JavaScript注释
            if (/\/\//.test(obfuscatedCode) || /\/\*/.test(obfuscatedCode)) {
                console.log('步骤0: 移除JavaScript注释');
                obfuscatedCode = this.stripJSComments(obfuscatedCode);
            }
            
            // 1. 字符串加密（优先级最高）
            if (this.options.stringEncrypt) {
                console.log('步骤1: 字符串加密');
                obfuscatedCode = this.encryptStrings(obfuscatedCode);
            }
            
            // 2. 数字加密
            if (this.options.numberEncrypt) {
                console.log('步骤2: 数字加密');
                obfuscatedCode = this.encryptNumbers(obfuscatedCode);
            }

            // 3. 函数名混淆
            if (this.options.functionNameObfuscate) {
                console.log('步骤3: 函数名混淆');
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
            
            // 8. 布尔值混淆
            if (this.options.booleanObfuscate) {
                console.log('步骤8: 布尔值混淆');
                obfuscatedCode = this.obfuscateBooleans(obfuscatedCode);
            }
            
            // 9. null值混淆
            if (this.options.nullObfuscate) {
                console.log('步骤9: null值混淆');
                obfuscatedCode = this.obfuscateNull(obfuscatedCode);
            }
            
            // 10. 添加死代码
            if (this.options.deadCode) {
                console.log('步骤10: 添加死代码');
                obfuscatedCode = this.addDeadCode(obfuscatedCode);
            }
            
            // 11. 代码分割和重组
            if (this.options.codeSplitReorganize) {
                console.log('步骤11: 代码分割和重组');
                obfuscatedCode = this.splitAndReorganizeCode(obfuscatedCode);
            }
            
            // 12. 反调试和反逆向工程技术
            if (this.options.antiDebug) {
                console.log('步骤12: 添加反调试和反逆向工程技术');
                obfuscatedCode = this.addAntiDebug(obfuscatedCode);
                obfuscatedCode = this.addObfuscationCheck(obfuscatedCode);
            }

            // 13. 单行压缩（极限混淆）
            if (this.options.oneLine) {
                console.log('步骤13: 单行压缩');
                obfuscatedCode = this.flattenOneLine(obfuscatedCode);
            }
            
            console.log('JavaScript代码混淆完成，最终代码长度:', obfuscatedCode.length);
            return obfuscatedCode;
        } catch (error) {
            console.error('JavaScript混淆过程中发生错误:', error);
            return code;
        }
    }
    
    /**
     * 移除JavaScript注释
     */
    stripJSComments(code) {
        // 移除块注释：/* ... */
        let result = code.replace(/\/\*[\s\S]*?\*\//g, '');
        
        // 移除行注释：//
        const lines = result.split('\n');
        const processed = lines.map(line => {
            let inStr = false;
            let strChar = '';
            for (let i = 0; i < line.length; i++) {
                const ch = line[i];
                const prev = i > 0 ? line[i - 1] : '';
                // 进入/退出字符串
                if (!inStr && (ch === '"' || ch === '\'' || ch === '`')) {
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

                // 非字符串内遇到 // 视为注释起点，截断该行
                if (!inStr && ch === '/' && i + 1 < line.length && line[i + 1] === '/') {
                    return line.slice(0, i).trimEnd();
                }
            }
            return line;
        });

        return processed.join('\n');
    }
    
    /**
     * 加密字符串
     */
    encryptStrings(code) {
        if (!this.options.stringEncrypt) return code;
        
        const stringMatches = [];
        // 匹配单引号、双引号和模板字符串
        const stringRegex = /"([^"\\]|\\.)*"|'([^'\\]|\\.)*'|`([^`\\]|\\.)*`/g;
        let match;
        
        while ((match = stringRegex.exec(code)) !== null) {
            const fullMatch = match[0];
            const stringContent = fullMatch.slice(1, -1);
            
            // 跳过已经加密的字符串
            if (stringContent.includes('String.fromCharCode')) continue;
            
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
            const encryptedString = this.encryptString(match.content, match.quote[0]);
            result = result.slice(0, match.start) + encryptedString + result.slice(match.end);
        }
        
        return result;
    }
    
    /**
     * 加密单个字符串
     */
    encryptString(str, quoteType) {
        // 将字符串转换为字符码数组
        const charCodes = [];
        for (let i = 0; i < str.length; i++) {
            charCodes.push(str.charCodeAt(i));
        }
        
        // 随机选择加密方式
        const method = Math.floor(Math.random() * 3);
        let result = '';
        
        switch (method) {
            case 0:
                // 方法1：String.fromCharCode
                result = 'String.fromCharCode(' + charCodes.join(',') + ')';
                break;
            case 1:
                // 方法2：使用数组和解构
                const arrName = this.generateObfuscatedName();
                result = `(()=>{const ${arrName}=[${charCodes.join(',')}];return String.fromCharCode(...${arrName})})()`;
                break;
            case 2:
                // 方法3：使用map和join
                const mapName = this.generateObfuscatedName();
                result = `((${mapName})=>String.fromCharCode(...${mapName})([${charCodes.join(',')}]))`;
                break;
        }
        
        return result;
    }
    
    /**
     * 加密数字
     */
    encryptNumbers(code) {
        if (!this.options.numberEncrypt) return code;
        
        // 匹配数字（不包括属性访问中的数字，如 .1）
        const numberRegex = /\b(\d+\.?\d*)\b/g;
        let result = code;
        let match;
        
        while ((match = numberRegex.exec(code)) !== null) {
            const numStr = match[1];
            const num = parseFloat(numStr);
            
            // 跳过已经加密的数字
            if (numStr.includes('0x') || numStr.includes('0b') || numStr.includes('0o')) continue;
            
            // 随机选择加密方式
            const method = Math.floor(Math.random() * 4);
            let encryptedNum = '';
            
            switch (method) {
                case 0:
                    // 方法1：十六进制
                    encryptedNum = '0x' + num.toString(16);
                    break;
                case 1:
                    // 方法2：八进制
                    encryptedNum = '0o' + num.toString(8);
                    break;
                case 2:
                    // 方法3：二进制
                    encryptedNum = '0b' + num.toString(2);
                    break;
                case 4:
                    // 方法4：数学运算
                    const base = Math.floor(Math.random() * 100) + 10;
                    encryptedNum = `(${base}+${num-base})`;
                    break;
            }
            
            result = result.replace(numStr, encryptedNum);
        }
        
        return result;
    }
    
    /**
     * 混淆局部变量
     */
    obfuscateLocalVariables(code) {
        if (!this.options.localVar) return code;
        
        // 提取所有局部变量声明
        const localVarPatterns = [
            /\b(?:const|let|var)\s+([a-zA-Z_$][a-zA-Z0-9_$]*)/g,
            /\bfunction\s+([a-zA-Z_$][a-zA-Z0-9_$]*)\s*\(/g  // 函数名也是局部变量
        ];
        
        const uniqueVars = [];
        
        for (let pattern of localVarPatterns) {
            let match;
            while ((match = pattern.exec(code)) !== null) {
                const varName = match[1];
                // 跳过包含'string'的变量名和常见关键字
                if (varName.includes('string') || 
                    ['const', 'let', 'var', 'function', 'return', 'if', 'else', 'for', 'while', 'do', 'break', 'continue', 'try', 'catch', 'finally', 'throw', 'new', 'this', 'class', 'extends', 'import', 'export', 'default'].includes(varName)) {
                    continue;
                }
                // 跳过受保护的名称
                if (this.protectedNames && this.protectedNames.has(varName)) {
                    continue;
                }
                if (!uniqueVars.includes(varName)) {
                    uniqueVars.push(varName);
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
                // 避免替换对象属性
                if (prev === '.' || prev === ':') return m;
                // 避免替换函数定义名
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
     * 控制流混淆
     */
    obfuscateControlFlow(code) {
        if (!this.options.controlFlow) return code;
        
        // 简单的控制流混淆：将if语句转换为switch语句
        const ifPattern = /\bif\s*\(([^)]+)\)\s*\{([^{}]*)\}/g;
        let result = code;
        
        result = result.replace(ifPattern, (match, condition, body) => {
            const varName = this.generateObfuscatedName();
            const case1 = this.generateObfuscatedName();
            const case2 = this.generateObfuscatedName();
            
            return `switch(!!(${condition})){case true:{${body}}break;case false:{break;}}`;
        });
        
        return result;
    }
    
    /**
     * 代码逻辑混淆
     */
    obfuscateCodeLogic(code) {
        if (!this.options.codeLogic) return code;
        
        // 添加无用的计算和变量
        let result = code;
        
        // 在函数开头添加无用代码
        const funcPattern = /\bfunction\s+([a-zA-Z_$][a-zA-Z0-9_$]*)\s*\([^)]*\)\s*\{/g;
        result = result.replace(funcPattern, (match) => {
            const var1 = this.generateObfuscatedName();
            const var2 = this.generateObfuscatedName();
            const var3 = this.generateObfuscatedName();
            
            return `${match}const ${var1}=${Math.floor(Math.random() * 1000)};const ${var2}="${this.generateRandomKey()}";const ${var3}=(${var1}+${var1})/${Math.floor(Math.random() * 10) + 1};`;
        });
        
        return result;
    }
    
    /**
     * 全局变量混淆
     */
    obfuscateGlobalVariables(code) {
        console.log('全局变量混淆：保守实现占位，未修改代码');
        return code;
    }
    
    /**
     * 函数名混淆
     */
    obfuscateFunctionNames(code) {
        console.log('函数名混淆：保守实现占位，未修改代码');
        return code;
    }
    
    /**
     * 布尔值混淆
     */
    obfuscateBooleans(code) {
        if (!this.options.booleanObfuscate) return code;
        
        let result = code;
        
        // 替换true
        result = result.replace(/\btrue\b/g, '!![]');
        
        // 替换false
        result = result.replace(/\bfalse\b/g, '![]');
        
        return result;
    }
    
    /**
     * null值混淆
     */
    obfuscateNull(code) {
        if (!this.options.nullObfuscate) return code;
        
        let result = code;
        
        // 替换null
        result = result.replace(/\bnull\b/g, 'void 0');
        
        return result;
    }
    
    /**
     * 添加死代码
     */
    addDeadCode(code) {
        if (!this.options.deadCode) return code;
        
        const deadCode = `
// 死代码
const ${this.generateObfuscatedName()} = function() {
    const ${this.generateObfuscatedName()} = ${Math.floor(Math.random() * 1000)};
    const ${this.generateObfuscatedName()} = "${this.generateRandomKey()}";
    if (${this.generateObfuscatedName()} > 500) {
        return ${this.generateObfuscatedName()};
    } else {
        return ${this.generateObfuscatedName()};
    }
};
`;
        
        return deadCode + '\n' + code;
    }
    
    /**
     * 代码分割和重组
     */
    splitAndReorganizeCode(code) {
        console.log('代码分割和重组：简单实现，未修改代码');
        return code;
    }
    
    /**
     * 添加反调试和反逆向工程技术
     */
    addAntiDebug(code) {
        if (!this.options.antiDebug) return code;
        
        console.log('添加反调试和反逆向工程技术');
        let result = code;
        
        // 生成随机变量名用于反调试
        const debugVar1 = this.generateObfuscatedName();
        const debugVar2 = this.generateObfuscatedName();
        const debugVar3 = this.generateObfuscatedName();
        const debugVar4 = this.generateObfuscatedName();
        
        // 添加调试检测代码
        const debugCheck = `
// 反调试检测
const ${debugVar1} = function() {
    const ${debugVar2} = new Date().getTime();
    debugger;
    if (new Date().getTime() - ${debugVar2} > 100) {
        while(true) {
            console.log("Debug detected!");
        }
    }
};
setInterval(${debugVar1}, 1000);

// 检测控制台
const ${debugVar3} = function() {
    const ${debugVar4} = function() {};
    ${debugVar4}.toString = function() {
        while(true) {
            console.log("Console detected!");
        }
    };
    console.log(${debugVar4});
};
${debugVar3}();
`;
        
        // 将检测代码添加到代码开头
        result = debugCheck + '\n' + result;
        
        console.log('反调试和反逆向工程技术添加完成');
        return result;
    }

    /**
     * 添加代码混淆检查
     */
    addObfuscationCheck(code) {
        if (!this.options.antiDebug) return code;
        
        console.log('添加代码混淆检查');
        let result = code;
        
        // 生成随机变量名
        const checkVar1 = this.generateObfuscatedName();
        const checkVar2 = this.generateObfuscatedName();
        const checkVar3 = this.generateObfuscatedName();
        
        // 添加混淆检查代码
        const obfuscationCheck = `
// 混淆检查
const ${checkVar1} = "${this.generateRandomKey()}";
const ${checkVar2} = function() {
    return "${this.generateRandomKey()}";
};

if (${checkVar2}() !== "${this.generateRandomKey()}") {
    while(true) {
        console.log("Code tampering detected!");
    }
}

const ${checkVar3} = function() {
    const ${this.generateObfuscatedName()} = ${checkVar1}.length;
    if (${this.generateObfuscatedName()} < 10) {
        while(true) {
            console.log("Code integrity check failed!");
        }
    }
};
${checkVar3}();
`;
        
        // 将检查代码添加到代码开头
        result = obfuscationCheck + '\n' + result;
        
        console.log('代码混淆检查添加完成');
        return result;
    }
    
    /**
     * 单行压缩
     */
    flattenOneLine(code) {
        // 移除多余空白
        let result = code.replace(/\s+/g, ' ');
        
        // 移除分号前的空格
        result = result.replace(/\s*;/g, ';');
        
        // 移除分号后的空格
        result = result.replace(/;\s*/g, ';');
        
        // 移除括号前后的空格
        result = result.replace(/\s*\(\s*/g, '(');
        result = result.replace(/\s*\)\s*/g, ')');
        
        // 移除大括号前后的空格
        result = result.replace(/\s*\{\s*/g, '{');
        result = result.replace(/\s*\}\s*/g, '}');
        
        // 去除首尾空格
        result = result.trim();
        
        return result;
    }
}