/**
 * 应用程序主逻辑
 * 处理用户交互和混淆流程
 */

// 初始化MDUI组件
document.addEventListener('DOMContentLoaded', function() {
    // 初始化对话框
    const dialog = new mdui.Dialog('#helpDialog');
    
    // 帮助按钮点击事件
    const helpBtn = document.getElementById('helpButton');
    if (helpBtn) {
      helpBtn.addEventListener('click', function() {
        dialog.open();
      });
    }
    
    // 监听语言选择变化
    const languageRadios = document.querySelectorAll('input[name="language"]');
    languageRadios.forEach(radio => {
        radio.addEventListener('change', function() {
            toggleObfuscationOptions(this.value);
        });
    });
    
    // 初始化时根据默认选择的语言显示相应的选项
    const defaultLanguage = document.querySelector('input[name="language"]:checked').value;
    toggleObfuscationOptions(defaultLanguage);
});

/**
 * 根据选择的语言类型显示/隐藏相应的混淆选项
 */
function toggleObfuscationOptions(language) {
    // 获取所有混淆选项的父元素
    const obfuscationOptions = document.querySelector('.mdui-list');
    
    // 获取所有混淆选项
    const allOptions = obfuscationOptions.querySelectorAll('.mdui-list-item');
    
    if (language === 'lua') {
        // 显示Lua相关的选项，隐藏JavaScript相关的选项
        allOptions.forEach(option => {
            const checkbox = option.querySelector('input[type="checkbox"]');
            if (checkbox && checkbox.id.startsWith('js')) {
                option.style.display = 'none';
            } else {
                option.style.display = '';
            }
        });
    } else if (language === 'javascript') {
        // 显示JavaScript相关的选项，隐藏Lua相关的选项
        allOptions.forEach(option => {
            const checkbox = option.querySelector('input[type="checkbox"]');
            if (checkbox && checkbox.id.startsWith('js')) {
                option.style.display = '';
            } else {
                option.style.display = 'none';
            }
        });
    }
}

/**
 * 混淆代码
 */
function obfuscateCode() {
    const sourceCode = document.getElementById('sourceCode').value;
    
    if (!sourceCode.trim()) {
        mdui.snackbar({
            message: '请输入要混淆的代码',
            position: 'top'
        });
        return;
    }
    
    // 获取选择的语言类型
    const language = document.querySelector('input[name="language"]:checked').value;
    
    // 显示加载状态
    const obfuscateBtn = event.target;
    const originalText = obfuscateBtn.innerHTML;
    obfuscateBtn.innerHTML = '<i class="mdui-icon material-icons mdui-spin"></i> 混淆中...';
    obfuscateBtn.disabled = true;
    
    // 使用setTimeout模拟异步处理，避免UI阻塞
    setTimeout(() => {
        try {
            let obfuscatedCode;
            
            if (language === 'lua') {
                // 获取Lua混淆选项
                const options = {
                    controlFlow: document.getElementById('controlFlow').checked,
                    codeLogic: document.getElementById('codeLogic').checked,
                    localVar: document.getElementById('localVar').checked,
                    globalVar: document.getElementById('globalVar').checked,
                    functionNameObfuscate: document.getElementById('functionNameObfuscate').checked,
                    stringEncrypt: document.getElementById('stringEncrypt').checked,
                    stringEncryptLong: document.getElementById('stringEncryptLong').checked,
                    numberEncrypt: document.getElementById('numberEncrypt').checked,
                    tableEncrypt: document.getElementById('tableEncrypt').checked,
                    booleanObfuscate: document.getElementById('booleanObfuscate').checked,
                    nilObfuscate: document.getElementById('nilObfuscate').checked,
                    gotoObfuscate: document.getElementById('gotoObfuscate').checked,
                    junkCode: document.getElementById('junkCode').checked,
                    codeSplitReorganize: document.getElementById('codeSplitReorganize').checked,
                    antiDebug: document.getElementById('antiDebug').checked,
                    oneLine: document.getElementById('oneLine').checked,
                    aggressive: document.getElementById('aggressive').checked
                };
                
                // 创建Lua混淆器实例
                const obfuscator = new LuaObfuscator(options);
                
                // 执行混淆
                obfuscatedCode = obfuscator.obfuscate(sourceCode);
            } else if (language === 'javascript') {
                // 获取JavaScript混淆选项
                const options = {
                    stringEncrypt: document.getElementById('jsStringEncrypt').checked,
                    numberEncrypt: document.getElementById('jsNumberEncrypt').checked,
                    controlFlow: document.getElementById('jsControlFlow').checked,
                    deadCode: document.getElementById('jsDeadCode').checked,
                    oneLine: document.getElementById('oneLine').checked
                };
                
                // 创建JavaScript混淆器实例
                const obfuscator = new JSObfuscator(options);
                
                // 执行混淆
                obfuscatedCode = obfuscator.obfuscate(sourceCode);
            }
            
            // 显示结果
            document.getElementById('obfuscatedCode').value = obfuscatedCode;
            
            // 显示成功消息
            mdui.snackbar({
                message: '代码混淆成功！',
                position: 'top'
            });
        } catch (error) {
            console.error('混淆过程中出错:', error);
            mdui.snackbar({
                message: '混淆过程中出错: ' + error.message,
                position: 'top',
                timeout: 5000
            });
        } finally {
            // 恢复按钮状态
            obfuscateBtn.innerHTML = originalText;
            obfuscateBtn.disabled = false;
        }
    }, 100);
}

/**
 * 清空源代码
 */
function clearSource() {
    document.getElementById('sourceCode').value = '';
    document.getElementById('obfuscatedCode').value = '';
    mdui.snackbar({
        message: '已清空',
        position: 'top'
    });
}

/**
 * 加载示例代码
 */
function loadExample() {
    // 获取选择的语言类型
    const language = document.querySelector('input[name="language"]:checked').value;
    
    let exampleCode;
    
    if (language === 'lua') {
        exampleCode = `-- 示例Lua代码
local function calculateFactorial(n)
    if n <= 1 then
        return 1
    else
        return n * calculateFactorial(n - 1)
    end
end

local function main()
    local numbers = {5, 10, 15}
    local results = {}
    
    for i, num in ipairs(numbers) do
        results[i] = calculateFactorial(num)
        print(string.format("Factorial of %d is %d", num, results[i]))
    end
    
    return results
end

-- 执行主函数
local result = main()
if result then
    print("Calculation completed successfully")
else
    print("Calculation failed")
end`;
    } else if (language === 'javascript') {
        exampleCode = `// 示例JavaScript代码
function calculateFactorial(n) {
    if (n <= 1) {
        return 1;
    } else {
        return n * calculateFactorial(n - 1);
    }
}

function main() {
    const numbers = [5, 10, 15];
    const results = [];
    
    for (let i = 0; i < numbers.length; i++) {
        const num = numbers[i];
        results[i] = calculateFactorial(num);
        console.log(\`Factorial of \${num} is \${results[i]}\`);
    }
    
    return results;
}

// 执行主函数
const result = main();
if (result) {
    console.log("Calculation completed successfully");
} else {
    console.log("Calculation failed");
}`;
    }
    
    document.getElementById('sourceCode').value = exampleCode;
    mdui.snackbar({
        message: '已加载示例代码',
        position: 'top'
    });
}

/**
 * 复制混淆结果
 */
function copyResult() {
    const obfuscatedCode = document.getElementById('obfuscatedCode').value;
    
    if (!obfuscatedCode.trim()) {
        mdui.snackbar({
            message: '没有可复制的内容',
            position: 'top'
        });
        return;
    }
    
    // 创建临时文本区域
    const textarea = document.createElement('textarea');
    textarea.value = obfuscatedCode;
    document.body.appendChild(textarea);
    textarea.select();
    
    try {
        document.execCommand('copy');
        mdui.snackbar({
            message: '已复制到剪贴板',
            position: 'top'
        });
    } catch (err) {
        console.error('复制失败:', err);
        mdui.snackbar({
            message: '复制失败',
            position: 'top'
        });
    } finally {
        document.body.removeChild(textarea);
    }
}

/**
 * 下载混淆结果
 */
function downloadResult() {
    const obfuscatedCode = document.getElementById('obfuscatedCode').value;
    
    if (!obfuscatedCode.trim()) {
        mdui.snackbar({
            message: '没有可下载的内容',
            position: 'top'
        });
        return;
    }
    
    // 获取选择的语言类型
    const language = document.querySelector('input[name="language"]:checked').value;
    const fileExtension = language === 'lua' ? '.lua' : '.js';
    
    // 创建Blob对象
    const blob = new Blob([obfuscatedCode], { type: 'text/plain' });
    
    // 创建下载链接
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `obfuscated${fileExtension}`;
    document.body.appendChild(a);
    
    // 触发下载
    a.click();
    
    // 清理
    setTimeout(() => {
        document.body.removeChild(a);
        URL.revokeObjectURL(url);
    }, 0);
    
    mdui.snackbar({
        message: '文件已下载',
        position: 'top'
    });
}

/**
 * 代码验证函数 - 用于验证混淆后的代码是否能正确运行
 * 注意：这是一个模拟函数，实际环境中需要Lua解释器支持
 */
function validateCode(code) {
    // 在实际应用中，这里应该使用Lua解释器来验证代码
    // 由于浏览器环境限制，这里只是一个模拟
    
    try {
        // 简单的语法检查
        new Function(code);
        return { valid: true, message: '代码语法正确' };
    } catch (error) {
        return { valid: false, message: '语法错误: ' + error.message };
    }
}