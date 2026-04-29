
# Custom Claude Code Switcher (Bash/Zsh)
claude-switch() {
    echo "========================================"
    echo "🤖 Choose your Claude Code Brain:"
    echo "1) 🟡 Regular Claude Pro (\$20 Account)"
    echo "2) 🟢 OpenRouter (Free Coding Models)"
    echo "========================================"
    read -p "Enter 1 or 2: " choice

    if [ "$choice" == "1" ]; then
        echo "Clearing OpenRouter overrides... Switching to native Anthropic."
        unset ANTHROPIC_BASE_URL
        unset ANTHROPIC_AUTH_TOKEN
        claude

    elif [ "$choice" == "2" ]; then
        echo "========================================"
        echo "🛠️ Select a Free OpenRouter Model:"
        echo "1) Tencent Hy3 Preview (Best overall logic)"
        echo "2) NVIDIA Nemotron 3 (Best for complex architecture)"
        echo "3) inclusionAI Ling (Best for fast execution)"
        echo "4) Qwen 3 Coder (Best for raw speed)"
        echo "5) Enter a custom model ID"
        echo "========================================"
        read -p "Enter 1-5: " mod_choice

        case $mod_choice in
            1) model="tencent/hy3-preview:free" ;;
            2) model="nvidia/nemotron-3-super-120b-a12b:free" ;;
            3) model="inclusionai/ling-2.6-1t:free" ;;
            4) model="qwen/qwen3-coder:free" ;;
            5) read -p "Enter custom Model ID: " model ;;
            *) echo "Invalid choice. Defaulting to Tencent Hy3."; model="tencent/hy3-preview:free" ;;
        esac

        echo "Applying OpenRouter overrides..."
        export ANTHROPIC_BASE_URL="https://openrouter.ai/api/v1"
        export ANTHROPIC_AUTH_TOKEN="YOUR_OPENROUTER_API_KEY"
        
        echo "Launching Claude Code with model: $model"
        claude --model "$model"

    else
        echo "Invalid choice. Exiting."
    fi
}
