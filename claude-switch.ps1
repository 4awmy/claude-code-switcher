
function claude-switch {
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host " Claude Code Brain Switcher "
    Write-Host "1) Regular Claude Pro ($20 Account)"
    Write-Host "2) OpenRouter (Free Coding Models)"
    Write-Host "========================================" -ForegroundColor Cyan
    $choice = Read-Host "Enter 1 or 2"

    if ($choice -eq "1") {
        Write-Host "Clearing OpenRouter overrides... Switching to native Anthropic." -ForegroundColor Yellow
        if (Test-Path Env:ANTHROPIC_BASE_URL) { Remove-Item Env:ANTHROPIC_BASE_URL }
        if (Test-Path Env:ANTHROPIC_AUTH_TOKEN) { Remove-Item Env:ANTHROPIC_AUTH_TOKEN }
        claude

    } elseif ($choice -eq "2") {
        Write-Host "========================================" -ForegroundColor Cyan
        Write-Host " Select a Reliable Free Model: "
        Write-Host "1) Google Gemma 3 (Working Now!)"
        Write-Host "2) Meta Llama 3.3 70B (High Logic)"
        Write-Host "3) Qwen 2.5 Coder (Fast)"
        Write-Host "4) Mistral 7B (Lightweight)"
        Write-Host "5) Enter a custom model ID"
        Write-Host "========================================" -ForegroundColor Cyan
        $mod_choice = Read-Host "Enter 1-5"

        switch ($mod_choice) {
            "1" { $model = "google/gemma-3-27b-it:free" }
            "2" { $model = "meta-llama/llama-3.3-70b-instruct:free" }
            "3" { $model = "qwen/qwen-2.5-coder-32b-instruct:free" }
            "4" { $model = "mistralai/mistral-7b-instruct:free" }
            "5" { $model = Read-Host "Enter custom Model ID" }
            Default { Write-Host "Invalid choice. Defaulting to Gemma 3."; $model = "google/gemma-3-27b-it:free" }
        }

        Write-Host "Applying OpenRouter overrides..." -ForegroundColor Green
        $Env:ANTHROPIC_BASE_URL = "https://openrouter.ai/api/v1"
        $Env:ANTHROPIC_AUTH_TOKEN = "YOUR_OPENROUTER_API_KEY"
        
        Write-Host "Launching Claude Code with model: $model" -ForegroundColor Green
        Write-Host "(Note: Free models can be slow or rate-limited. If it doesn't reply, try Option 1.)" -ForegroundColor Gray
        claude --model "$model"

    } else {
        Write-Host "Invalid choice. Exiting." -ForegroundColor Red
    }
}
