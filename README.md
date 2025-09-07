# Dotfiles
Personal development environment configuration files and setup scripts.

## Quick Start
```bash
# Clone this repo
git clone https://github.com/err0rless/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# setup
./setup.sh
```

## What's Included

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

## Available Commands

```bash
just --list              # Show all available recipes
just setup               # Full installation (recommended)
```

## Configuration Files
- `nvim/` - Neovim configuration with lazy.nvim
- `.zshrc` - Zsh shell configuration
- `.gitconfig` - Git configuration
- `.tmux.conf` - tmux configuration

## Customization

### Environment Presets
For environment-specific configurations, you can create additional preset files that are automatically imported:

**Zsh presets:**
- `~/.oh-my-zsh/personal.zsh` - Personal aliases, exports, and functions
- `~/.oh-my-zsh/work.zsh` - Work-specific configuration

**Git presets:**
- `~/.gitconfig.personal` - Personal user config, aliases, and settings
- `~/.gitconfig.work` - Work-specific user config, remotes, and settings

These files are conditionally loaded if they exist, allowing you to keep different environment configurations separate and modular.

### Adding New Tools
Add new recipes to the `Justfile`:

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
- **Linux/Ubuntu** - Full support with apt
- **macOS** - Full support with Homebrew
- **Windows** - Not currently supported

## Post-Installation

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

## Manual Steps

Some tools may require additional setup:
- SSH keys configuration
- Git user configuration
- Cloud service authentications
- IDE-specific extensions

## Documentation

- [Neovim Config](./nvim/README.md)
- [tmux Guide](https://github.com/tmux/tmux/wiki)
- [Oh My Zsh](https://ohmyz.sh/)
