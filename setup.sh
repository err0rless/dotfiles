#!/bin/bash

echo "🚀 Dotfiles Bootstrap Script"
echo "Installing Rust and just command runner..."

# Install Rust
if ! command -v cargo &> /dev/null; then
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
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

echo ""
echo "✅ Bootstrap complete!"
echo "Now run: just setup"
