# autosuggestions
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Chord "Ctrl+f" -Function AcceptSuggestion 

# alias
Set-Alias -Name v -Value nvim

# prompt
function prompt  
{  
    # $PP = " $([char]27)[31m>$([char]27)[0m"
    $ESC = [char]27
    $CWD = "$ESC[32m$($executionContext.SessionState.Path.CurrentLocation)$ESC[0m"
    "$CWD$(' >' * ($nestedPromptLevel + 1)) "  
    # "PS $($executionContext.SessionState.Path.CurrentLocation)$(' >' * ($nestedPromptLevel + 1)) "  
}
