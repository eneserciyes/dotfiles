#!/bin/bash

set -e

echo "Installing AI tools..."

if ! command -v npm &> /dev/null; then
    echo "npm not found. Please install Node.js first."
    exit 1
fi

echo "Installing claude-code..."
sudo npm install -g @anthropic-ai/claude-code

echo "Installing codex..."
sudo npm install -g @openai/codex

echo "AI tools installed successfully!"
