#!/bin/bash

set -euo pipefail

echo "Installing AI CLI tools (claude-code, codex)..."

if ! command -v npm &> /dev/null; then
    echo "npm not found. Ensure nvm/node installation succeeded first."
    exit 1
fi

if ! npm list -g --depth=0 @anthropic-ai/claude-code > /dev/null 2>&1; then
    npm install -g @anthropic-ai/claude-code
fi

if ! npm list -g --depth=0 @openai/codex > /dev/null 2>&1; then
    npm install -g @openai/codex
fi

echo "AI CLI tools installed successfully!"
