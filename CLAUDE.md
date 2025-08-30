# Claude Code Instructions

This file contains instructions for Claude Code to help with maintaining this dotfiles repository.

## Linting and Type Checking

When making changes to code in this repository, always run the following commands to ensure code quality:

```bash
# For shell scripts
shellcheck setup.sh

# For justfile syntax
just --dry-run --list
```

If you encounter any linting or type checking errors, fix them before completing the task.

## Repository Structure

- `setup.sh` - Bootstrap script that installs Rust and just
- `justfile` - Main installation recipes using just command runner
- `nvim/` - Neovim configuration directory
- `.zshrc`, `.gitconfig`, `.tmux.conf` - Configuration files
- `README.md` - User-facing documentation
- `CLAUDE.md` - This file with Claude Code instructions

## Common Tasks

When maintaining this repository:

1. Always test changes on both Linux and macOS where possible
2. **Use attributes instead of shell conditionals**: Prefer `[linux]`, `[macos]`, `[unix]`, `[windows]` attributes over if statements in justfile recipes
3. **Avoid shell-dependent operations**: Use just's built-in functionality and attributes rather than shell scripting where possible
4. Keep the README.md updated when adding new tools or recipes
5. Ensure all installation scripts are idempotent (safe to run multiple times)
6. Add new CLI tools to the appropriate recipe in the justfile

## Justfile Best Practices

- Use `[os]` attributes for platform-specific recipes instead of `if [[ "$OSTYPE" == ... ]]`
- Use `@echo` for output instead of shell echo when possible
- Avoid `#!/bin/bash` shebangs unless absolutely necessary
- Use line continuations with `\` for multi-line shell commands
- Leverage just's cross-platform nature with proper attributes

## Testing

Before committing changes, verify:
- `./setup.sh` runs without errors
- `just --list` shows all recipes
- `just --dry-run setup` completes without errors

## Commit Message Format

Use conventional commits: `<type>(<scope>): <description>`

**Examples:**
- `feat(setup.sh): add shellcheck installation`
- `fix(justfile): correct macOS attribute syntax`
- `docs(README): update installation instructions`