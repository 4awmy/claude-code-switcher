
function claude-switch {
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "🤖 Choose your Claude Code Brain:"
    Write-Host "1) 🟡 Regular Claude Pro ($20 Account)"
    Write-Host "2) 🟢 OpenRouter (Free Coding Models)"
    Write-Host "========================================" -ForegroundColor Cyan
    $choice = Read-Host "Enter 1 or 2"

    if ($choice -eq "1") {
        Write-Host "Clearing OpenRouter overrides... Switching to native Anthropic." -ForegroundColor Yellow
        if (Test-Path Env:ANTHROPIC_BASE_URL) { Remove-Item Env:ANTHROPIC_BASE_URL }
        if (Test-Path Env:ANTHROPIC_AUTH_TOKEN) { Remove-Item Env:ANTHROPIC_AUTH_TOKEN }
        claude

    } elseif ($choice -eq "2") {
        Write-Host "========================================" -ForegroundColor Cyan
        Write-Host "🛠️ Select a Free OpenRouter Model:"
        Write-Host "1) Tencent Hy3 Preview (Best overall logic)"
        Write-Host "2) NVIDIA Nemotron 3 (Best for complex architecture)"
        Write-Host "3) inclusionAI Ling (Best for fast execution)"
        Write-Host "4) Qwen 3 Coder (Best for raw speed)"
        Write-Host "5) Enter a custom model ID"
        Write-Host "========================================" -ForegroundColor Cyan
        $mod_choice = Read-Host "Enter 1-5"

        switch ($mod_choice) {
            "1" { $model = "tencent/hy3-preview:free" }
            "2" { $model = "nvidia/nemotron-3-super-120b-a12b:free" }
            "3" { $model = "inclusionai/ling-2.6-1t:free" }
            "4" { $model = "qwen/qwen3-coder:free" }
            "5" { $model = Read-Host "Enter custom Model ID" }
            Default { Write-Host "Invalid choice. Defaulting to Tencent Hy3."; $model = "tencent/hy3-preview:free" }
        }

        Write-Host "Applying OpenRouter overrides..." -ForegroundColor Green
        $Env:ANTHROPIC_BASE_URL = "https://openrouter.ai/api/v1"
        $Env:ANTHROPIC_AUTH_TOKEN = "YOUR_OPENROUTER_API_KEY"
        
        Write-Host "Launching Claude Code with model: $model" -ForegroundColor Green
        claude --model "$model"

    } else {
        Write-Host "Invalid choice. Exiting." -ForegroundColor Red
    }
}
