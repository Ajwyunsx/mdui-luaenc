# Lua Obfuscator 🔒

一个专业的 Lua 代码混淆工具，基于 MDUI 设计的现代化 Web 界面。

## ✨ 功能特性

- **变量名混淆** - 将变量名替换为随机字符串
- **控制流扁平化** - 打乱代码执行流程
- **字符串混淆** - 对字符串进行编码处理
- **死代码注入** - 插入无用代码干扰分析
- **不透明谓词** - 添加恒真/恒假条件
- **白名单保护** - 保护标准库函数调用
- **多语言支持** - 支持中文/英文界面切换
- **深色主题** - 支持浅色/深色主题切换

## 🚀 快速开始

### 在线使用

直接在浏览器中打开 `index.html` 文件即可使用。

### 本地运行

```bash
# 克隆项目
git clone https://github.com/Ajwyunsx/mdui-luaenc.git

# 进入目录
cd mdui-luaenc

# 安装依赖（可选，用于开发）
npm install

# 直接打开 index.html 或使用本地服务器
```

## 📖 使用方法

1. 在左侧文本框粘贴你的 Lua 源代码
2. 点击中间的 "立即混淆" 按钮
3. 在右侧文本框获取混淆后的代码
4. 点击复制按钮复制到剪贴板

## 🛠️ 技术栈

- **前端框架**: [MDUI](https://mdui.org/) - Material Design 风格 UI 库
- **Lua 解析器**: [luaparse](https://github.com/fstirlitz/luaparse) - JavaScript Lua 解析器
- **字体**: JetBrains Mono, Roboto

## 📝 更新日志

### v3.0 (2025-12-12)
- 重构混淆引擎，移除加密层
- 优化混淆算法，提升运行效率
- 改进代码结构，增强可维护性
- 更新界面设计

## ⚠️ 注意事项

- 混淆后的代码体积会增大
- 建议在发布前进行充分测试
- 部分高级 Lua 特性可能不被支持

## 📄 许可证

MIT License

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

---

Made with ❤️ by Ajwyunsx