
# Custom Claude Code Switcher (Bash/Zsh)
claude-switch() {
    echo "========================================"
    echo " Claude Code Brain Switcher "
    echo "1) Regular Claude Pro (\$20 Account)"
    echo "2) OpenRouter (Free Coding Models)"
    echo "========================================"
    read -p "Enter 1 or 2: " choice

    if [ "$choice" == "1" ]; then
        echo "Clearing OpenRouter overrides... Switching to native Anthropic."
        unset ANTHROPIC_BASE_URL
        unset ANTHROPIC_AUTH_TOKEN
        unset ANTHROPIC_API_KEY
        claude

    elif [ "$choice" == "2" ]; then
        echo "========================================"
        echo " Select a Reliable Free Model: "
        echo "1) Google Gemma 3 (Recommended)"
        echo "2) Meta Llama 3.3 70B (High Logic)"
        echo "3) Qwen 2.5 Coder (Fast)"
        echo "4) Mistral 7B (Lightweight)"
        echo "5) Enter a custom model ID"
        echo "========================================"
        read -p "Enter 1-5: " mod_choice

        case $mod_choice in
            1) model="google/gemma-3-27b-it:free" ;;
            2) model="meta-llama/llama-3.3-70b-instruct:free" ;;
            3) model="qwen/qwen-2.5-coder-32b-instruct:free" ;;
            4) model="mistralai/mistral-7b-instruct:free" ;;
            5) read -p "Enter custom Model ID: " model ;;
            *) echo "Invalid choice. Defaulting to Gemma 3."; model="google/gemma-3-27b-it:free" ;;
        esac

        echo "Applying OpenRouter overrides..."
        
        # CRITICAL FIXES FOR OPENROUTER
        export ANTHROPIC_BASE_URL="https://openrouter.ai/api"
        export ANTHROPIC_AUTH_TOKEN="YOUR_OPENROUTER_API_KEY"
        export ANTHROPIC_API_KEY="" # Must be empty to bypass native auth
        
        echo "Launching Claude Code with model: $model"
        claude --model "$model"

    else
        echo "Invalid choice. Exiting."
    fi
}
