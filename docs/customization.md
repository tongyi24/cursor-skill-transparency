# Customization Guide

## Overview

The skill transparency rule can be customized to match your preferences and workflow.

## Basic Customization

### Change the Emoji

Edit the rule file and replace the 🔧 emoji:

```markdown
## 声明格式

```
✨ 正在使用 [技能名称] 技能
目的：[一句话说明为什么使用这个技能]
```
```

Popular alternatives:
- 🎯 - Target/goal oriented
- 🚀 - Action/launch
- 💡 - Idea/insight
- 🔍 - Investigation/search
- ⚙️ - Settings/configuration
- 📋 - Checklist/task

### Change the Language

To use English instead of Chinese:

```markdown
## Declaration Format

```
🔧 Using [skill-name] skill
Purpose: [one-line explanation]
```
```

Example:
```
🔧 Using brainstorming skill
Purpose: To explore requirements and design a complete solution before coding
```

### Disable for Specific Skills

Add exceptions in the rule file:

```markdown
## 例外情况

**例外：**
- `using-superpowers` - 元技能，不需要声明
- `my-custom-skill` - 您的自定义技能
```

## Advanced Customization

### Conditional Application

Change when the rule applies:

```yaml
---
description: "..."
alwaysApply: false  # Only apply when explicitly needed
globs: ["**/*.ts", "**/*.tsx"]  # Only for TypeScript files
---
```

### Add Context Information

Enhance the announcement with more details:

```markdown
## 声明格式

```
🔧 正在使用 [技能名称] 技能
目的：[一句话说明]
预计步骤：[步骤数量]
预计时间：[估计时间]
```
```

### Custom Format for Different Skill Types

```markdown
## 声明格式

### 对于流程技能（brainstorming, writing-plans）
```
📋 [技能名称] 流程启动
目标：[目标说明]
```

### 对于开发技能（test-driven-development）
```
💻 [技能名称] 开发模式
规范：[遵循的规范]
```

### 对于调试技能（systematic-debugging）
```
🔍 [技能名称] 调试流程
方法：[调试方法]
```
```

## Project-Specific Customization

Create a project-specific version:

```bash
# Copy global rule to project
cp ~/.cursor/rules/skill-transparency.mdc \
   your-project/.cursor/rules/skill-transparency.mdc

# Edit project version
code your-project/.cursor/rules/skill-transparency.mdc
```

Project-specific rules override global rules.

## Team Customization

### Create a Team Template

```bash
# Create a team configuration repository
git init cursor-team-config
cd cursor-team-config

# Add the customized rule
mkdir -p rules
cp ~/.cursor/rules/skill-transparency.mdc rules/

# Commit and share
git add .
git commit -m "Add team skill transparency rule"
git push origin main
```

### Team Members Install

```bash
# Clone team config
git clone https://github.com/your-team/cursor-team-config.git

# Install team rules
cp cursor-team-config/rules/skill-transparency.mdc ~/.cursor/rules/
```

## Integration with Other Rules

### Combine with PUA Rule

If you have the PUA (problem-solving methodology) rule:

```yaml
---
description: "Skill transparency + PUA methodology"
alwaysApply: true
---

# Combined Rule

## Part 1: Skill Transparency
[Include skill transparency content]

## Part 2: PUA Methodology
[Include PUA content]
```

### Combine with Project-Specific Rules

```yaml
---
description: "Skill transparency for React projects"
alwaysApply: true
globs: ["**/*.tsx", "**/*.jsx"]
---

# React-Specific Skill Transparency

When using skills in React projects, also mention:
- Component type (functional/class)
- Hooks usage
- State management approach
```

## Skill-Specific Customization

### Add Detailed Format for Each Skill

```markdown
## 技能特定格式

### brainstorming
```
🔧 正在使用 brainstorming 技能
目的：设计 [功能名称]
阶段：探索 → 设计 → 审查
```

### test-driven-development
```
🔧 正在使用 test-driven-development 技能
目的：实现 [功能名称]
循环：RED → GREEN → REFACTOR
```

### systematic-debugging
```
🔧 正在使用 systematic-debugging 技能
目的：调查 [问题描述]
阶段：调查 → 假设 → 验证 → 修复
```
```

## Visual Customization

### Add Color Indicators (Markdown)

```markdown
🔧 **正在使用** `brainstorming` **技能**
> 目的：在编写代码前，先探索需求并设计完整方案
```

### Add Separators

```markdown
---
🔧 正在使用 brainstorming 技能
目的：在编写代码前，先探索需求并设计完整方案
---
```

### Add Boxes

```markdown
┌─────────────────────────────────────┐
│ 🔧 正在使用 brainstorming 技能      │
│ 目的：探索需求并设计完整方案         │
└─────────────────────────────────────┘
```

## Logging and Tracking

### Add Timestamp

```markdown
## 声明格式

```
🔧 正在使用 [技能名称] 技能 [时间戳]
目的：[一句话说明]
```
```

### Add Skill Counter

```markdown
## 声明格式

```
🔧 正在使用 [技能名称] 技能 (#[本次会话第N次使用])
目的：[一句话说明]
```
```

## Examples

### Minimal Version

```yaml
---
description: "Announce skill usage"
alwaysApply: true
---

When using any skill, announce: "Using [skill-name] for [purpose]"
```

### Verbose Version

```yaml
---
description: "Detailed skill transparency with context"
alwaysApply: true
---

When using any skill, provide:
1. Skill name and category
2. Purpose and expected outcome
3. Estimated steps and duration
4. Prerequisites and dependencies
5. Success criteria
```

### Silent Mode (Disable)

```yaml
---
description: "Skill transparency (disabled)"
alwaysApply: false
---

# Skill Transparency (Disabled)

This rule is currently disabled. To enable, set alwaysApply: true
```

## Testing Your Customization

After customizing, test with:

```
Test 1: "帮我添加一个功能"
Expected: Should see your customized announcement

Test 2: "修复这个 bug"
Expected: Should see debugging skill announcement

Test 3: "写一个函数"
Expected: Should see TDD skill announcement
```

## Sharing Your Customization

If you create a useful customization:

1. Fork this repository
2. Add your customization to `examples/`
3. Submit a pull request
4. Share with the community!

## Next Steps

- [Configuration Options](configuration.md)
- [Troubleshooting](troubleshooting.md)
- [Contributing](../CONTRIBUTING.md)
