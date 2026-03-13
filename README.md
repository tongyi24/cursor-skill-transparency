# Cursor Skill Transparency Rule

**[中文版](README_zh.md)**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Cursor](https://img.shields.io/badge/Cursor-Compatible-blue.svg)](https://cursor.com)

A Cursor rule that enforces AI agents to explicitly announce which skill they're using and why, improving transparency and predictability in AI-assisted development workflows.

## What This Does

This rule makes your AI agent **explicitly declare** which skill it's using before executing any workflow. Instead of silently applying skills, you'll see:

```
🔧 正在使用 design-feature 技能
目的：在编写代码前，先探索需求并设计完整方案

[Then the agent executes the skill...]
```

Works with **Cursor**, **Claude Code**, and other AI code editors that support rules.

## Why You Need This

### Without This Rule
- ❌ AI silently applies skills without telling you
- ❌ You don't know what workflow is being followed
- ❌ Hard to understand why certain steps are taken
- ❌ Difficult to interrupt or adjust the process

### With This Rule
- ✅ **Transparency**: Always know which skill is being used
- ✅ **Predictability**: Understand what will happen next
- ✅ **Learning**: Discover available skills and their purposes
- ✅ **Control**: Easy to stop or redirect if needed

## Installation

### Quick Install (Recommended)

#### Cursor IDE

**macOS / Linux:**
```bash
# Create directory and download rule file
mkdir -p ~/.cursor/rules && \
curl -o ~/.cursor/rules/skill-transparency.mdc \
  https://raw.githubusercontent.com/tongyi24/cursor-skill-transparency/main/skill-transparency.mdc
```

**Windows (PowerShell):**
```powershell
# Create directory and download rule file
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.cursor\rules" | Out-Null
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/tongyi24/cursor-skill-transparency/main/skill-transparency.mdc" `
  -OutFile "$env:USERPROFILE\.cursor\rules\skill-transparency.mdc"
```

**Windows (Git Bash):**
```bash
# Create directory and download rule file
mkdir -p ~/.cursor/rules && \
curl -o ~/.cursor/rules/skill-transparency.mdc \
  https://raw.githubusercontent.com/tongyi24/cursor-skill-transparency/main/skill-transparency.mdc
```

After installation, **restart Cursor** to activate the rule.

#### Claude Code

**macOS / Linux:**
```bash
# Create directory and download rule file
mkdir -p ~/.claude/rules && \
curl -o ~/.claude/rules/skill-transparency.mdc \
  https://raw.githubusercontent.com/tongyi24/cursor-skill-transparency/main/skill-transparency.mdc
```

**Windows (PowerShell):**
```powershell
# Create directory and download rule file
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.claude\rules" | Out-Null
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/tongyi24/cursor-skill-transparency/main/skill-transparency.mdc" `
  -OutFile "$env:USERPROFILE\.claude\rules\skill-transparency.mdc"
```

### Using Installation Script

The installation script automatically detects your platform and editor.

**macOS / Linux:**
```bash
# Clone repository
git clone https://github.com/tongyi24/cursor-skill-transparency.git
cd cursor-skill-transparency

# Run installer
chmod +x install.sh
./install.sh
```

**Windows (Command Prompt):**
```cmd
REM Clone repository
git clone https://github.com/tongyi24/cursor-skill-transparency.git
cd cursor-skill-transparency

REM Run installer
install.bat
```

**Windows (PowerShell):**
```powershell
# Clone repository
git clone https://github.com/tongyi24/cursor-skill-transparency.git
cd cursor-skill-transparency

# Run installer
.\install.bat
```

### Other AI Code Editors

For other editors that support Cursor-style rules:

**Global Installation:**
- Place `skill-transparency.mdc` in your editor's rules directory
- Common locations: `~/.editor-name/rules/` or `~/.config/editor-name/rules/`

**Project-Specific Installation:**
- Place in `your-project/.cursor/rules/skill-transparency.mdc`
- Or `your-project/.editor-name/rules/skill-transparency.mdc`

### Verify Installation

After installation, start a new chat session and ask:
```
"帮我添加一个新功能"
```

You should see:
```
🔧 正在使用 [skill-name] 技能
目的：[purpose]
```

If you see this, the rule is working correctly!

## Format

The rule enforces this declaration format:

```
🔧 正在使用 [skill-name] 技能
目的：[one-line explanation of why this skill is being used]
```

### Examples

**When adding a feature:**
```
🔧 正在使用 design-feature 技能
目的：在编写代码前，先探索需求并设计完整的认证方案
```

**When fixing a bug:**
```
🔧 正在使用 debug-systematically 技能
目的：系统化地找出问题根因，避免盲目猜测修复
```

**When writing code:**
```
🔧 正在使用 implement-with-tests 技能
目的：确保先编写测试，再实现功能代码
```

## Configuration

The rule is configured with `alwaysApply: true`, meaning it's active for all conversations. You can customize this in the frontmatter:

```yaml
---
description: "Your custom description"
alwaysApply: true  # Set to false to disable
---
```

## Compatible With

This rule works with:

- ✅ **Community Skill Frameworks** - Superpowers, awesome-agent-skills, etc.
- ✅ **Custom Skills** - Your own project-specific skills
- ✅ **Team Skills** - Skills shared within your team
- ✅ **Any Cursor Skills** - Works with all skills in the Cursor ecosystem

## Use Cases

### For Individual Developers
- Understand what your AI is doing
- Learn about available skills
- Debug workflow issues
- Control the development process

### For Teams
- Standardize AI behavior across team members
- Document which skills are being used
- Train new team members on available workflows
- Ensure consistent development practices

### For Learning
- Discover new skills as they're used
- Understand when each skill is appropriate
- Build mental models of AI workflows
- Improve prompt engineering skills

## How It Works

1. **Detection**: The rule monitors when any skill is invoked
2. **Announcement**: Forces the AI to declare the skill name and purpose
3. **Execution**: The skill's workflow proceeds as normal
4. **Transparency**: You always know what's happening

## Documentation

- [Installation Guide](docs/installation.md)
- [Configuration Options](docs/configuration.md)
- [Customization Guide](docs/customization.md)
- [Troubleshooting](docs/troubleshooting.md)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Inspired by best practices in AI-assisted development
- Built for the [Cursor](https://cursor.com) AI code editor
- Thanks to the Cursor community for feedback and suggestions

## Related Projects

- [Superpowers](https://github.com/obra/superpowers) - Complete software development workflow for coding agents
- [Cursor Skills](https://github.com/daniel-scrivner/cursor-skills) - Collection of reusable Cursor skills
- [Awesome Agent Skills](https://github.com/JackyST0/awesome-agent-skills) - Curated list of agent skills
- [Cursor Documentation](https://cursor.com/docs) - Official Cursor documentation

## Support

- **Issues**: [GitHub Issues](https://github.com/tongyi24/cursor-skill-transparency/issues)
- **Discussions**: [GitHub Discussions](https://github.com/tongyi24/cursor-skill-transparency/discussions)

## Star History

If you find this useful, please consider giving it a star! ⭐

---

**Made with ❤️ for the Cursor community**
