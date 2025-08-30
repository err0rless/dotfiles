# 🏠 Dotfiles

> 🤖 This repository was created with assistance from [Claude Code](https://claude.ai/code)

Personal development environment configuration files and setup scripts.

## ⚡ Quick Start

```bash
# Clone this repo
git clone <your-repo-url> ~/.dotfiles
cd ~/.dotfiles

# Bootstrap (installs Rust and just)
./setup.sh

# Full setup
just setup
```

## 📦 What's Included

### Core Tools
- **Neovim** - Modern text editor with full configuration
- **tmux** - Terminal multiplexer with plugin manager
- **Oh My Zsh** - Enhanced shell experience
- **Git** - With delta for better diffs

### Modern CLI Replacements
- `fd` - Fast file finder (replaces `find`)
- `ripgrep` - Fast text search (replaces `grep`) 
- `eza` - Modern `ls` with colors and icons
- `bat` - Syntax-highlighted `cat`
- `zoxide` - Smart `cd` with frecency
- `fzf` - Fuzzy finder for everything
- `dust` - Disk usage analyzer
- `btop` - Beautiful system monitor
- `hyperfine` - Command benchmarking

### Development Tools
- **NVM** - Node.js version manager
- **Claude Code** - AI-powered development assistant
- **Python 3** - With pip package manager
- **Rust toolchain** - Modern systems programming

## 🎯 Available Commands

```bash
just --list              # Show all available recipes
just setup               # Full installation (recommended)
just install-packages    # System packages only
just install-rust-tools  # Rust CLI tools only
just install-neovim      # Neovim binary installation
just copy-configs        # Copy config files only
just clean               # Remove installation artifacts
just update              # Update all tools
```

## 📁 Configuration Files

- `nvim/` - Neovim configuration with lazy.nvim
- `.zshrc` - Zsh shell configuration
- `.gitconfig` - Git configuration
- `.tmux.conf` - tmux configuration

## 🔧 Customization

### Adding New Tools
Add new recipes to the `justfile`:

```just
# Install your-tool
install-your-tool:
    @echo "Installing your-tool..."
    cargo install your-tool
```

### Modifying Configs
1. Edit configuration files directly
2. Run `just copy-configs` to apply changes
3. Or create symlinks for live editing

### OS Support
- ✅ **Linux/Ubuntu** - Full support with apt
- ✅ **macOS** - Full support with Homebrew
- ❌ **Windows** - Not currently supported

## 🚀 Post-Installation

```bash
# Restart shell or source config
source ~/.zshrc

# Install tmux plugins (press prefix + I in tmux)
tmux

# Setup Node.js
nvm install --lts
nvm use --lts

# Configure Git with your details
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## 🛠️ Manual Steps

Some tools may require additional setup:
- SSH keys configuration
- Git user configuration
- Cloud service authentications
- IDE-specific extensions

## 📚 Documentation

- [Neovim Config](./nvim/README.md)
- [tmux Guide](https://github.com/tmux/tmux/wiki)
- [Oh My Zsh](https://ohmyz.sh/)