oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/kali.omp.json" | Invoke-Expression

Import-Module -Name Terminal-Icons

Import-Module PSReadLine
Set-PSReadLineOption -PredictionViewStyle ListView -EditMode Emacs
#Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

Import-Module PSFzf
$env:FZF_DEFAULT_OPTS='--height 70% --layout=reverse --border'
#Set-PsFzfOption -TabExpansion
Set-PsFzfOption -EnableAliasFuzzyEdit
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'


. "$PSScriptRoot\utilities.ps1"