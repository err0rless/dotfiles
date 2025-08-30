#!/bin/bash

echo "🚀 Dotfiles Bootstrap Script"
echo "Installing Rust and just command runner..."

# Install Rust
if ! command -v cargo &> /dev/null; then
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    # shellcheck source=/dev/null
    source "$HOME/.cargo/env"
else
    echo "Rust already installed ✓"
fi

# Install just
if ! command -v just &> /dev/null; then
    echo "Installing just..."
    cargo install just
else
    echo "just already installed ✓"
fi

# Install shellcheck
if ! command -v shellcheck &> /dev/null; then
    echo "Installing shellcheck..."
    if command -v apt-get &> /dev/null; then
        sudo apt-get update && sudo apt-get install -y shellcheck
    elif command -v brew &> /dev/null; then
        brew install shellcheck
    else
        echo "⚠️  Could not install shellcheck - unsupported package manager"
        echo "Please install shellcheck manually for your system"
    fi
else
    echo "shellcheck already installed ✓"
fi

echo ""
echo "✅ Bootstrap complete!"
echo "Now run: just setup"
