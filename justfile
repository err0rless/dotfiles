# Dotfiles setup and management

# Show available recipes
default:
    @just --list

# Full setup - installs everything
setup: install-packages install-neovim install-tmux install-rust-tools install-nvm install-claude install-zsh copy-configs
    @echo "🎉 Dotfiles setup complete!"

# Install system packages (Linux)
[linux]
install-packages:
    @echo "🐧 Installing packages with apt..."
    sudo apt-get update
    sudo apt-get install build-essential
    sudo apt install tmux jq python3 python3-pip curl unzip zip wget git btop

# Install system packages (macOS)
[macos]
install-packages:
    @echo "🍎 Installing packages with brew..."
    # Install Homebrew if not already installed
    if ! command -v brew &> /dev/null; then \
        echo "Installing Homebrew..."; \
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
    fi
    brew install tmux jq python3 curl unzip zip wget git btop
    # build-essential equivalent on macOS
    xcode-select --install 2>/dev/null || echo "Xcode command line tools already installed"

# Install Neovim from binary (Linux)
[linux]
install-neovim:
    @echo "📝 Installing Neovim for Linux..."
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
    sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
    rm nvim-linux-x86_64.tar.gz

# Install Neovim from binary (macOS)
[macos]
install-neovim:
    @echo "📝 Installing Neovim for macOS..."
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-macos-arm64.tar.gz
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-macos-arm64.tar.gz
    sudo ln -sf /opt/nvim-macos-arm64/bin/nvim /usr/local/bin/nvim
    rm nvim-macos-arm64.tar.gz

# Install tmux plugin manager
install-tmux:
    @echo "🖥️  Installing tmux plugin manager..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install Rust CLI tools
install-rust-tools:
    @echo "🦀 Installing Rust CLI tools..."
    cargo install fd-find
    cargo install ripgrep
    cargo install eza
    cargo install bat
    cargo install zoxide --locked
    cargo install git-delta
    cargo install du-dust
    cargo install hyperfine

# Install fzf
install-fzf:
    @echo "🔍 Installing fzf..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install

# Install NVM
install-nvm:
    @echo "📦 Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Install Claude Code
install-claude:
    @echo "🤖 Installing Claude Code..."
    curl -fsSL https://claude.ai/install.sh | sh

# Install Oh My Zsh
install-zsh: install-fzf
    @echo "🐚 Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Copy configuration files
copy-configs:
    @echo "📋 Copying configuration files..."
    cp -r nvim ~/.config/
    cp .zshrc .gitconfig .tmux.conf ~/

# Clean up installation files
clean:
    @echo "🧹 Cleaning up..."
    rm -f nvim-*.tar.gz

# Update all tools
update:
    @echo "🔄 Updating tools..."
    cargo install-update -a
    ~/.fzf/install --update-rc