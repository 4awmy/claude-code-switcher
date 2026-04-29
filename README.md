# Claude Code Switcher 🤖

A simple shell utility to switch between native Anthropic Claude Pro and a curated list of free OpenRouter coding models for [Claude Code](https://claude.ai/code).

## Features
- **Easy Toggle**: Switch between native Anthropic and OpenRouter with a single command.
- **Model Selection**: Choose from top free coding models:
  - Tencent Hy3 Preview
  - NVIDIA Nemotron 3
  - inclusionAI Ling
  - Qwen 3 Coder
- **Cross-Platform**: Includes support for both **Bash/Zsh** and **PowerShell**.

## Installation

### For Bash/Zsh (Linux, macOS, Git Bash)
1. Open your `~/.bashrc` or `~/.zshrc` file.
2. Copy the contents of `claude-switch.sh` into the file.
3. Replace `YOUR_OPENROUTER_API_KEY` with your actual key.
4. Run `source ~/.bashrc` (or your relevant profile).

### For PowerShell (Windows)
1. Open your PowerShell profile by running `notepad $PROFILE`.
2. Copy the contents of `claude-switch.ps1` into the file.
3. Replace `YOUR_OPENROUTER_API_KEY` with your actual key.
4. Save and restart your terminal, or run `. $PROFILE`.

## Usage
Type the following command in your terminal:
```bash
claude-switch
```

## Security Note
This script stores your API key locally in your shell profile. Ensure your machine is secure and do not share your profile files publicly without removing your keys.
