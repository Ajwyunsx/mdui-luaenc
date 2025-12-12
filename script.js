document.addEventListener('DOMContentLoaded', () => {
    const sourceInput = document.getElementById('source-code');
    const outputInput = document.getElementById('output-code');
    const obfuscateBtn = document.getElementById('obfuscate-btn');
    const copyBtn = document.getElementById('copy-btn');
    const themeToggle = document.getElementById('theme-toggle');
    const langToggle = document.getElementById('lang-toggle');
    const body = document.body;

    // --- Internationalization (i18n) ---
    const i18n = {
        en: {
            page_title: "Lua Obfuscator - Secure Your Code",
            app_title: "Lua Obfuscator",
            hero_title: "Professional Lua Obfuscator",
            hero_subtitle: "Protect your Lua scripts with advanced polynomial encryption, control flow flattening, and anti-debugging techniques.",
            source_code: "Source Code",
            btn_obfuscate: "Obfuscate",
            version: "v3.0 Ultra Security",
            output_code: "Obfuscated Output",
            footer_copyright: "© 2025 Lua Obfuscator.",
            footer_text: "Designed with MDUI.",
            placeholder_input: "-- Paste your Lua code here...",
            placeholder_output: "-- Obfuscated code will appear here...",
            tooltip_theme: "Toggle Theme",
            tooltip_github: "View on GitHub",
            tooltip_copy: "Copy to Clipboard",
            tooltip_lang: "Switch Language",
            msg_empty_source: "Please enter some Lua code first!",
            msg_success: "Obfuscation successful!",
            msg_copy_empty: "Nothing to copy!",
            msg_copy_success: "Copied to clipboard!",
            msg_copy_fail: "Failed to copy to clipboard.",
            msg_error_prefix: "Error: ",
            btn_processing: "Processing...",
            lang_switch_msg: "Switched to English"
        },
        zh: {
            page_title: "Lua 混淆器 - 保护您的代码安全",
            app_title: "Lua 混淆器",
            hero_title: "专业 Lua 代码混淆工具",
            hero_subtitle: "采用高级多项式加密、控制流扁平化和反调试技术，全方位保护您的 Lua 脚本安全。",
            source_code: "源代码",
            btn_obfuscate: "立即混淆",
            version: "v3.0 极致安全版",
            output_code: "混淆输出",
            footer_copyright: "© 2025 Lua Obfuscator.",
            footer_text: "基于 MDUI 设计",
            placeholder_input: "-- 在此粘贴您的 Lua 代码...",
            placeholder_output: "-- 混淆后的代码将显示在这里...",
            tooltip_theme: "切换主题",
            tooltip_github: "查看 GitHub",
            tooltip_copy: "复制到剪贴板",
            tooltip_lang: "切换语言",
            msg_empty_source: "请先输入一些 Lua 代码！",
            msg_success: "混淆成功！",
            msg_copy_empty: "没有可复制的内容！",
            msg_copy_success: "已复制到剪贴板！",
            msg_copy_fail: "复制失败。",
            msg_error_prefix: "错误：",
            btn_processing: "处理中...",
            lang_switch_msg: "已切换至中文"
        }
    };

    let currentLang = localStorage.getItem('lang') || (navigator.language.startsWith('zh') ? 'zh' : 'en');

    // Tooltip Registry to manage instances
    const tooltipRegistry = new Map();

    // Language display names
    const langNames = {
        en: { short: 'EN', full: 'English', icon: '🇺🇸' },
        zh: { short: '中', full: '中文', icon: '🇨🇳' }
    };

    const updateLanguage = (lang, showNotification = false) => {
        currentLang = lang;
        localStorage.setItem('lang', lang);
        const t = i18n[lang];

        // Update HTML lang attribute for accessibility and SEO
        document.documentElement.lang = lang === 'zh' ? 'zh-CN' : 'en';

        // Update Document Title
        document.title = t.page_title;

        // Update language toggle button to show current language
        const langBtnIcon = langToggle.querySelector('i');
        if (langBtnIcon) {
            // Keep the translate icon but add a small indicator
            langToggle.setAttribute('title', langNames[lang].full);
        }

        // Add transition class for smooth updates
        document.body.classList.add('lang-transitioning');

        // Update Text Content with fade effect
        document.querySelectorAll('[data-i18n]').forEach(el => {
            const key = el.getAttribute('data-i18n');
            if (t[key]) {
                el.style.opacity = '0';
                setTimeout(() => {
                    el.textContent = t[key];
                    el.style.opacity = '1';
                }, 150);
            }
        });

        // Update Placeholders
        document.querySelectorAll('[data-i18n-placeholder]').forEach(el => {
            const key = el.getAttribute('data-i18n-placeholder');
            if (t[key]) el.placeholder = t[key];
        });
        
        // Update Tooltips
        document.querySelectorAll('[data-i18n-tooltip]').forEach(el => {
            const key = el.getAttribute('data-i18n-tooltip');
            const content = t[key];
            
            if (content) {
                // Update attribute for persistence
                el.setAttribute('mdui-tooltip', `{content: '${content}'}`);

                if (tooltipRegistry.has(el)) {
                    const instance = tooltipRegistry.get(el);
                    // Update options for next show
                    if (instance.options) {
                        instance.options.content = content;
                    }
                    // If tooltip is currently open/rendered, update its text directly
                    if (instance.$tooltip) {
                        instance.$tooltip.text(content);
                    }
                } else {
                    // Create new instance with translated content
                    const newInstance = new mdui.Tooltip(el, {
                        content: content
                    });
                    tooltipRegistry.set(el, newInstance);
                }
            }
        });

        // Remove transition class after animation completes
        setTimeout(() => {
            document.body.classList.remove('lang-transitioning');
        }, 300);

        // Show notification if requested
        if (showNotification) {
            mdui.snackbar({
                message: t.lang_switch_msg,
                position: 'bottom',
                timeout: 2000
            });
        }
    };

    // Initialize Language
    updateLanguage(currentLang);

    // Language Toggle Event with animation
    langToggle.addEventListener('click', () => {
        // Add rotation animation to the button
        langToggle.style.transform = 'rotate(360deg)';
        langToggle.style.transition = 'transform 0.3s ease';
        
        setTimeout(() => {
            langToggle.style.transform = '';
            langToggle.style.transition = '';
        }, 300);

        const newLang = currentLang === 'en' ? 'zh' : 'en';
        updateLanguage(newLang, true);
    });

    // --- Theme Logic ---
    const setTheme = (theme) => {
        if (theme === 'dark') {
            body.classList.add('mdui-theme-layout-dark');
            themeToggle.querySelector('i').textContent = 'brightness_7'; // Sun icon
        } else {
            body.classList.remove('mdui-theme-layout-dark');
            themeToggle.querySelector('i').textContent = 'brightness_4'; // Moon icon
        }
        localStorage.setItem('theme', theme);
    };

    // Initialize theme
    const savedTheme = localStorage.getItem('theme') || (window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light');
    setTheme(savedTheme);

    themeToggle.addEventListener('click', () => {
        const currentTheme = body.classList.contains('mdui-theme-layout-dark') ? 'dark' : 'light';
        setTheme(currentTheme === 'dark' ? 'light' : 'dark');
    });

    // --- Obfuscation Logic ---
    
    // Check dependencies
    if (typeof luaparse === 'undefined') {
        mdui.snackbar({ message: 'Error: luaparse library not loaded. Check internet connection.' });
        console.error('luaparse not found');
    }

    if (typeof LuaObfuscator === 'undefined') {
        mdui.snackbar({ message: 'Error: LuaObfuscator engine not loaded.' });
        console.error('LuaObfuscator not found');
    }

    obfuscateBtn.addEventListener('click', () => {
        const t = i18n[currentLang];
        const source = sourceInput.value;
        
        if (!source.trim()) {
            mdui.snackbar({ message: t.msg_empty_source });
            return;
        }

        // Show loading state
        const originalContent = obfuscateBtn.innerHTML;
        obfuscateBtn.disabled = true;
        obfuscateBtn.innerHTML = `<i class="mdui-icon material-icons mdui-icon-left mdui-text-color-white">hourglass_empty</i>${t.btn_processing}`;

        // Use setTimeout to allow UI to update
        setTimeout(() => {
            try {
                if (typeof window.LuaObfuscator === 'undefined') {
                    throw new Error("LuaObfuscator engine is not loaded.");
                }

                const obfuscated = window.LuaObfuscator.obfuscate(source);
                outputInput.value = obfuscated;
                mdui.snackbar({ message: t.msg_success, position: 'bottom' });
            } catch (e) {
                console.error(e);
                mdui.snackbar({ message: t.msg_error_prefix + e.message, timeout: 5000 });
                outputInput.value = '-- ' + t.msg_error_prefix + '\n' + e.message;
            } finally {
                obfuscateBtn.disabled = false;
                obfuscateBtn.innerHTML = originalContent;
                // Re-apply translation to button in case language changed during processing
                updateLanguage(currentLang); 
                // Restore icon as updateLanguage only updates text
                obfuscateBtn.innerHTML = `<i class="mdui-icon material-icons mdui-icon-left">lock</i><span data-i18n="btn_obfuscate">${t.btn_obfuscate}</span>`;
            }
        }, 50);
    });

    copyBtn.addEventListener('click', () => {
        const t = i18n[currentLang];
        const output = outputInput.value;
        if (!output) {
            mdui.snackbar({ message: t.msg_copy_empty });
            return;
        }
        navigator.clipboard.writeText(output).then(() => {
            mdui.snackbar({ message: t.msg_copy_success });
        }).catch(err => {
            console.error('Failed to copy: ', err);
            mdui.snackbar({ message: t.msg_copy_fail });
        });
    });
});
