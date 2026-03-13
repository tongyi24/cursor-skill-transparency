# Contributing to Cursor Skill Transparency

Thank you for your interest in contributing! This document provides guidelines for contributing to this project.

## Ways to Contribute

- 🐛 Report bugs
- 💡 Suggest new features
- 📝 Improve documentation
- 🎨 Share customizations
- 🌍 Add translations
- ✨ Submit code improvements

## Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/tongyi24/cursor-skill-transparency.git`
3. Create a branch: `git checkout -b feature/your-feature-name`
4. Make your changes
5. Test your changes
6. Commit: `git commit -m "Add: your feature description"`
7. Push: `git push origin feature/your-feature-name`
8. Open a Pull Request

## Development Setup

```bash
# Clone the repository
git clone https://github.com/tongyi24/cursor-skill-transparency.git
cd cursor-skill-transparency

# Test the rule locally
cp skill-transparency.mdc ~/.cursor/rules/
# Restart Cursor and test
```

## Contribution Guidelines

### Code Style

- Use clear, descriptive variable names
- Follow existing formatting conventions
- Add comments for complex logic
- Keep the rule file well-organized

### Documentation

- Update README.md if adding features
- Add examples for new functionality
- Keep language clear and concise
- Include both English and Chinese where appropriate

### Commit Messages

Use conventional commit format:

```
type: brief description

Detailed explanation (optional)
```

Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Formatting changes
- `refactor`: Code refactoring
- `test`: Adding tests
- `chore`: Maintenance tasks

Examples:
```
feat: add support for custom emoji selection

docs: update installation guide for Windows users

fix: correct YAML frontmatter syntax
```

### Pull Request Process

1. **Update Documentation**: Ensure README.md and relevant docs are updated
2. **Test Thoroughly**: Test your changes with Cursor
3. **Describe Changes**: Clearly explain what and why in the PR description
4. **Link Issues**: Reference related issues using #issue-number
5. **Be Responsive**: Respond to review comments promptly

### Testing Checklist

Before submitting a PR, verify:

- [ ] Rule file has valid YAML frontmatter
- [ ] Rule works in Cursor (tested)
- [ ] Documentation is updated
- [ ] Examples are provided
- [ ] No syntax errors
- [ ] Follows existing format conventions

## Reporting Bugs

When reporting bugs, please include:

1. **Description**: Clear description of the bug
2. **Steps to Reproduce**: Detailed steps to reproduce the issue
3. **Expected Behavior**: What you expected to happen
4. **Actual Behavior**: What actually happened
5. **Environment**:
   - Cursor version
   - Operating system
   - Rule version
6. **Screenshots**: If applicable

Use this template:

```markdown
**Bug Description**
[Clear description]

**Steps to Reproduce**
1. Step 1
2. Step 2
3. Step 3

**Expected Behavior**
[What should happen]

**Actual Behavior**
[What actually happens]

**Environment**
- Cursor version: [version]
- OS: [operating system]
- Rule version: [version]

**Screenshots**
[If applicable]
```

## Suggesting Features

When suggesting features, please include:

1. **Use Case**: Why is this feature needed?
2. **Proposed Solution**: How should it work?
3. **Alternatives**: Other approaches considered?
4. **Examples**: Concrete examples of usage

Use this template:

```markdown
**Feature Request**
[Clear description]

**Use Case**
[Why is this needed?]

**Proposed Solution**
[How should it work?]

**Alternatives Considered**
[Other approaches]

**Examples**
[Concrete examples]
```

## Adding Translations

To add a translation:

1. Create a new file: `skill-transparency.[lang].mdc`
2. Translate all content
3. Maintain the same structure
4. Test with Cursor
5. Submit a PR

Example:
```
skill-transparency.en.mdc  # English
skill-transparency.zh.mdc  # Chinese
skill-transparency.ja.mdc  # Japanese
```

## Sharing Customizations

If you've created a useful customization:

1. Add it to `examples/` directory
2. Include a README explaining the customization
3. Provide usage examples
4. Submit a PR

## Code of Conduct

### Our Standards

- Be respectful and inclusive
- Welcome newcomers
- Accept constructive criticism
- Focus on what's best for the community
- Show empathy towards others

### Unacceptable Behavior

- Harassment or discrimination
- Trolling or insulting comments
- Personal or political attacks
- Publishing others' private information
- Other unprofessional conduct

## Questions?

- Open an issue for questions
- Join discussions in GitHub Discussions

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

## Recognition

Contributors will be recognized in:
- README.md contributors section
- Release notes
- Project documentation

Thank you for contributing! 🎉
