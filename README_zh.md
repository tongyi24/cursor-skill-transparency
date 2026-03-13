# Cursor 技能透明化规则

**[English](README.md)**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Cursor](https://img.shields.io/badge/Cursor-Compatible-blue.svg)](https://cursor.com)

让 AI 助手明确告诉你它在使用哪个技能，提升开发流程的透明度和可控性。

## 这是什么？

这是一个 Cursor IDE 规则文件，强制 AI 助手在使用任何技能（Skill）时，必须先明确声明：
- 🔧 正在使用什么技能
- 🎯 为什么使用这个技能

安装后，AI 不会再默默地应用各种技能，而是会先告诉你它在做什么。

## 效果示例

当你让 AI 帮你添加功能时，它会先声明：

```
🔧 正在使用 design-feature 技能
目的：在编写代码前，先探索需求并设计完整方案

[然后 AI 才开始执行具体步骤...]
```

## 为什么需要？

### 没有这个规则时
- ❌ AI 默默地应用各种技能，你不知道它在做什么
- ❌ 不清楚 AI 遵循的是什么工作流程
- ❌ 难以理解为什么 AI 会采取某些步骤
- ❌ 需要时难以中断或调整

### 有了这个规则后
- ✅ **透明**：始终知道 AI 在使用哪个技能
- ✅ **可预测**：理解接下来会发生什么
- ✅ **可学习**：发现可用的技能及其用途
- ✅ **可控制**：需要时可以轻松中断或调整

## 安装方法

### 方法一：一键安装（推荐）

#### Cursor IDE

**macOS / Linux:**
```bash
# 创建目录并下载规则文件
mkdir -p ~/.cursor/rules && \
curl -o ~/.cursor/rules/skill-transparency.mdc \
  https://raw.githubusercontent.com/tongyi24/cursor-skill-transparency/main/skill-transparency.mdc
```

**Windows (PowerShell):**
```powershell
# 创建目录并下载规则文件
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.cursor\rules" | Out-Null
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/tongyi24/cursor-skill-transparency/main/skill-transparency.mdc" `
  -OutFile "$env:USERPROFILE\.cursor\rules\skill-transparency.mdc"
```

**Windows (Git Bash):**
```bash
# 创建目录并下载规则文件
mkdir -p ~/.cursor/rules && \
curl -o ~/.cursor/rules/skill-transparency.mdc \
  https://raw.githubusercontent.com/tongyi24/cursor-skill-transparency/main/skill-transparency.mdc
```

安装完成后，**重启 Cursor** 即可生效。

#### Claude Code

**macOS / Linux:**
```bash
# 创建目录并下载规则文件
mkdir -p ~/.claude/rules && \
curl -o ~/.claude/rules/skill-transparency.mdc \
  https://raw.githubusercontent.com/tongyi24/cursor-skill-transparency/main/skill-transparency.mdc
```

**Windows (PowerShell):**
```powershell
# 创建目录并下载规则文件
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.claude\rules" | Out-Null
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/tongyi24/cursor-skill-transparency/main/skill-transparency.mdc" `
  -OutFile "$env:USERPROFILE\.claude\rules\skill-transparency.mdc"
```

### 方法二：使用安装脚本

安装脚本会自动检测您的平台和编辑器。

**macOS / Linux:**
```bash
# 克隆仓库
git clone https://github.com/tongyi24/cursor-skill-transparency.git
cd cursor-skill-transparency

# 运行安装脚本
chmod +x install.sh
./install.sh
```

**Windows (Command Prompt):**
```cmd
REM 克隆仓库
git clone https://github.com/tongyi24/cursor-skill-transparency.git
cd cursor-skill-transparency

REM 运行安装脚本
install.bat
```

**Windows (PowerShell):**
```powershell
# 克隆仓库
git clone https://github.com/tongyi24/cursor-skill-transparency.git
cd cursor-skill-transparency

# 运行安装脚本
.\install.bat
```

### 验证安装

安装完成后，启动一个新的对话会话并询问：
```
"帮我添加一个新功能"
```

如果看到以下输出，说明规则已生效：
```
🔧 正在使用 [skill-name] 技能
目的：[purpose]
```

## 声明格式

规则强制使用以下格式：

```
🔧 正在使用 [技能名称] 技能
目的：[一句话说明为什么使用这个技能]
```

### 示例

**添加功能时：**
```
🔧 正在使用 design-feature 技能
目的：在编写代码前，先探索需求并设计完整的认证方案
```

**修复 Bug 时：**
```
🔧 正在使用 debug-systematically 技能
目的：系统化地找出问题根因，避免盲目猜测修复
```

**编写代码时：**
```
🔧 正在使用 implement-with-tests 技能
目的：确保先编写测试，再实现功能代码
```

## 配置

规则默认配置为 `alwaysApply: true`，意味着对所有对话都生效。您可以在文件开头的 frontmatter 中自定义：

```yaml
---
description: "您的自定义描述"
alwaysApply: true  # 设置为 false 可禁用
---
```

## 兼容性

此规则适用于：

- ✅ **社区技能框架** - Superpowers、awesome-agent-skills 等
- ✅ **自定义技能** - 您自己的项目特定技能
- ✅ **团队技能** - 团队内共享的技能
- ✅ **所有 Cursor 技能** - 适用于 Cursor 生态系统中的所有技能

## 使用场景

### 个人开发者
- 了解 AI 正在做什么
- 学习可用的技能
- 调试工作流程问题
- 控制开发过程

### 团队协作
- 在团队成员间标准化 AI 行为
- 记录正在使用的技能
- 培训新团队成员了解可用工作流程
- 确保一致的开发实践

### 学习提升
- 在使用时发现新技能
- 理解每个技能的适用场景
- 建立 AI 工作流程的心智模型
- 提升提示词工程技能

## 工作原理

1. **检测**：规则监控任何技能的调用
2. **声明**：强制 AI 声明技能名称和目的
3. **执行**：技能的工作流程正常进行
4. **透明**：您始终知道正在发生什么

## 文档

- [安装指南](docs/installation.md)
- [配置选项](docs/configuration.md)
- [自定义指南](docs/customization.md)
- [故障排除](docs/troubleshooting.md)

## 贡献

欢迎贡献！请随时提交 Pull Request。

1. Fork 本仓库
2. 创建您的特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交您的更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启一个 Pull Request

## 许可证

本项目采用 MIT 许可证 - 详见 [LICENSE](LICENSE) 文件。

## 致谢

- 受 AI 辅助开发最佳实践启发
- 为 [Cursor](https://cursor.com) AI 代码编辑器构建
- 感谢 Cursor 社区的反馈和建议

## 相关项目

- [Superpowers](https://github.com/obra/superpowers) - 编码代理的完整软件开发工作流程
- [Cursor Skills](https://github.com/daniel-scrivner/cursor-skills) - 可重用的 Cursor 技能集合
- [Awesome Agent Skills](https://github.com/JackyST0/awesome-agent-skills) - 精选的代理技能列表
- [Cursor 文档](https://cursor.com/docs) - Cursor 官方文档

## 支持

- **问题反馈**：[GitHub Issues](https://github.com/tongyi24/cursor-skill-transparency/issues)
- **讨论交流**：[GitHub Discussions](https://github.com/tongyi24/cursor-skill-transparency/discussions)

## Star 历史

如果您觉得有用，请给个 Star！⭐

---

**用 ❤️ 为 Cursor 社区打造**
