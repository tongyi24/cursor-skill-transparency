#!/bin/bash
# Cursor Skill Transparency Rule - Cross-Platform Installation Script
# Supports: macOS, Linux, Windows (Git Bash/WSL)

set -e

RULE_FILE="skill-transparency.mdc"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Detect platform
detect_platform() {
    case "$(uname -s)" in
        Darwin*)    echo "macos" ;;
        Linux*)     echo "linux" ;;
        MINGW*|MSYS*|CYGWIN*) echo "windows" ;;
        *)          echo "unknown" ;;
    esac
}

PLATFORM=$(detect_platform)

echo "=== Cursor Skill Transparency Rule Installer ==="
echo "Platform: $PLATFORM"
echo ""

# Detect editor and set installation directory
detect_editor() {
    local cursor_dir="$HOME/.cursor/rules"
    local claude_dir="$HOME/.claude/rules"
    
    if [ -d "$HOME/.cursor" ]; then
        echo "cursor:$cursor_dir"
    elif [ -d "$HOME/.claude" ]; then
        echo "claude:$claude_dir"
    else
        echo "cursor:$cursor_dir"  # Default to Cursor
    fi
}

EDITOR_INFO=$(detect_editor)
EDITOR_NAME=$(echo "$EDITOR_INFO" | cut -d: -f1)
RULES_DIR=$(echo "$EDITOR_INFO" | cut -d: -f2)

echo "Detected editor: $EDITOR_NAME"
echo "Installation directory: $RULES_DIR"
echo ""

# Create rules directory if it doesn't exist
if [ ! -d "$RULES_DIR" ]; then
    echo "📁 Creating rules directory..."
    mkdir -p "$RULES_DIR"
    echo "✅ Directory created: $RULES_DIR"
else
    echo "✅ Rules directory found: $RULES_DIR"
fi

# Check if rule already exists
if [ -f "$RULES_DIR/$RULE_FILE" ]; then
    echo ""
    echo "⚠️  Rule file already exists!"
    read -p "Do you want to backup and replace it? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        backup_name="skill-transparency.mdc.backup.$(date +%Y%m%d-%H%M%S)"
        mv "$RULES_DIR/$RULE_FILE" "$RULES_DIR/$backup_name"
        echo "✅ Backed up to: $backup_name"
    else
        echo "❌ Installation cancelled."
        exit 0
    fi
fi

# Copy rule file
echo ""
echo "📋 Installing rule file..."
if [ -f "$SCRIPT_DIR/$RULE_FILE" ]; then
    cp "$SCRIPT_DIR/$RULE_FILE" "$RULES_DIR/"
    echo "✅ Rule installed: $RULES_DIR/$RULE_FILE"
else
    echo "❌ Error: $RULE_FILE not found in script directory"
    exit 1
fi

# Verify installation
echo ""
echo "🔍 Verifying installation..."
if [ -f "$RULES_DIR/$RULE_FILE" ]; then
    file_size=$(wc -c < "$RULES_DIR/$RULE_FILE" 2>/dev/null || stat -f%z "$RULES_DIR/$RULE_FILE" 2>/dev/null || echo "unknown")
    echo "✅ Installation verified (file size: $file_size bytes)"
else
    echo "❌ Verification failed"
    exit 1
fi

# Display next steps
echo ""
echo "=== Installation Complete! ==="
echo ""
echo "Next steps:"
if [ "$EDITOR_NAME" = "cursor" ]; then
    echo "1. Restart Cursor IDE"
elif [ "$EDITOR_NAME" = "claude" ]; then
    echo "1. Restart Claude Code"
else
    echo "1. Restart your AI code editor"
fi
echo "2. Start a new chat session"
echo "3. Try asking: '帮我添加一个新功能'"
echo "4. You should see: '🔧 正在使用 [skill-name] 技能'"
echo ""
echo "Platform-specific notes:"
case "$PLATFORM" in
    macos)
        echo "- macOS: Installation complete"
        ;;
    linux)
        echo "- Linux: Installation complete"
        ;;
    windows)
        echo "- Windows: If using PowerShell, you may need to run:"
        echo "  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser"
        ;;
esac
echo ""
echo "For more information:"
echo "- Documentation: $SCRIPT_DIR/docs/"
echo "- README: $SCRIPT_DIR/README.md"
echo ""
echo "🎉 Happy coding with transparent skills!"
