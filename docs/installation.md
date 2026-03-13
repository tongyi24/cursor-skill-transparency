# Installation Guide / 安装指南

## Quick Start / 快速开始

最快的安装方式（自动创建目录）：

The fastest way to install (automatically creates directory):

```bash
mkdir -p ~/.cursor/rules && \
curl -o ~/.cursor/rules/skill-transparency.mdc \
  https://raw.githubusercontent.com/tongyi24/cursor-skill-transparency/main/skill-transparency.mdc
```

安装完成后重启 Cursor。

Then restart Cursor.

## Detailed Installation

### Prerequisites

- Cursor IDE installed
- Basic familiarity with terminal/command line

### Step-by-Step Installation

#### 1. Create Rules Directory

First, ensure the rules directory exists:

```bash
# For global installation (recommended)
mkdir -p ~/.cursor/rules/

# For project-specific installation
mkdir -p your-project/.cursor/rules/
```

#### 2. Download the Rule File

**Option A: Using curl**

```bash
# Global installation
curl -o ~/.cursor/rules/skill-transparency.mdc \
  https://raw.githubusercontent.com/tongyi24/cursor-skill-transparency/main/skill-transparency.mdc

# Project-specific installation
curl -o your-project/.cursor/rules/skill-transparency.mdc \
  https://raw.githubusercontent.com/tongyi24/cursor-skill-transparency/main/skill-transparency.mdc
```

**Option B: Using wget**

```bash
# Global installation
wget -O ~/.cursor/rules/skill-transparency.mdc \
  https://raw.githubusercontent.com/tongyi24/cursor-skill-transparency/main/skill-transparency.mdc
```

**Option C: Manual download**

1. Visit [skill-transparency.mdc](https://github.com/tongyi24/cursor-skill-transparency/blob/main/skill-transparency.mdc)
2. Click "Raw" button
3. Save the file to `~/.cursor/rules/skill-transparency.mdc`

#### 3. Verify Installation

```bash
# Check if the file exists
ls -lh ~/.cursor/rules/skill-transparency.mdc

# View the first few lines
head -20 ~/.cursor/rules/skill-transparency.mdc
```

You should see the YAML frontmatter:

```yaml
---
description: "强制 AI 在使用任何技能（Skill）时明确声明技能名称和使用目的..."
alwaysApply: true
---
```

#### 4. Restart Cursor

The rule will take effect after restarting Cursor:

1. Close all Cursor windows
2. Reopen Cursor
3. Start a new chat session

## Installation Locations

### Global Installation (Recommended)

**Location**: `~/.cursor/rules/skill-transparency.mdc`

**Pros**:
- ✅ Works for all projects
- ✅ Install once, use everywhere
- ✅ Easy to maintain

**Cons**:
- ❌ Can't have different settings per project

### Project-Specific Installation

**Location**: `your-project/.cursor/rules/skill-transparency.mdc`

**Pros**:
- ✅ Project-specific customization
- ✅ Can override global settings
- ✅ Version controlled with project

**Cons**:
- ❌ Need to install for each project
- ❌ More maintenance overhead

### Priority

If both exist, project-specific rules take priority over global rules.

## Platform-Specific Instructions

### macOS / Linux

```bash
# Create directory
mkdir -p ~/.cursor/rules/

# Download rule
curl -o ~/.cursor/rules/skill-transparency.mdc \
  https://raw.githubusercontent.com/tongyi24/cursor-skill-transparency/main/skill-transparency.mdc

# Verify
cat ~/.cursor/rules/skill-transparency.mdc | head -10
```

### Windows (PowerShell)

```powershell
# Create directory
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.cursor\rules"

# Download rule
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/tongyi24/cursor-skill-transparency/main/skill-transparency.mdc" `
  -OutFile "$env:USERPROFILE\.cursor\rules\skill-transparency.mdc"

# Verify
Get-Content "$env:USERPROFILE\.cursor\rules\skill-transparency.mdc" | Select-Object -First 10
```

### Windows (Git Bash)

```bash
# Create directory
mkdir -p ~/.cursor/rules/

# Download rule
curl -o ~/.cursor/rules/skill-transparency.mdc \
  https://raw.githubusercontent.com/tongyi24/cursor-skill-transparency/main/skill-transparency.mdc
```

## Verification

After installation and restart, test the rule:

1. Open Cursor
2. Start a new chat
3. Ask: "帮我添加一个新功能"
4. You should see:

```
🔧 正在使用 brainstorming 技能
目的：在编写代码前，先探索需求并设计完整方案
```

If you see this, the rule is working correctly!

## Troubleshooting

### Rule Not Working

**Problem**: AI doesn't announce skills

**Solutions**:
1. Verify file location: `ls ~/.cursor/rules/skill-transparency.mdc`
2. Check file permissions: `chmod 644 ~/.cursor/rules/skill-transparency.mdc`
3. Restart Cursor completely
4. Check for syntax errors in the file

### File Not Found

**Problem**: Can't find the rules directory

**Solution**:
```bash
# Create the directory structure
mkdir -p ~/.cursor/rules/

# Verify it exists
ls -la ~/.cursor/
```

### Permission Denied

**Problem**: Can't write to rules directory

**Solution**:
```bash
# Fix permissions
chmod 755 ~/.cursor/
chmod 755 ~/.cursor/rules/
```

## Updating

To update to the latest version:

```bash
# Backup current version
cp ~/.cursor/rules/skill-transparency.mdc ~/.cursor/rules/skill-transparency.mdc.backup

# Download latest version
curl -o ~/.cursor/rules/skill-transparency.mdc \
  https://raw.githubusercontent.com/tongyi24/cursor-skill-transparency/main/skill-transparency.mdc

# Restart Cursor
```

## Uninstallation

To remove the rule:

```bash
# Remove the file
rm ~/.cursor/rules/skill-transparency.mdc

# Restart Cursor
```

## Next Steps

- [Configuration Options](configuration.md)
- [Customization Guide](customization.md)
- [Troubleshooting](troubleshooting.md)
