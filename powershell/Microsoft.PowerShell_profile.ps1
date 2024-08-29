# Path
# ====
$env:Path += ";D:\7-Zip"
$env:Path += ";D:\powershell7\7"
$env:Path += ";D:\Vim\vim91"
$env:Path += ";D:\Neovim\bin"
$env:Path += ";D:\mingw64\mingw64\bin"
$env:Path += ";D:\LLVM\bin"

$env:Path += ";D:\commandline_tools\lsp\lua-language-server-3.9.1-win32-x64\bin"
$env:Path += ";D:\commandline_tools\lsp\clangd_18.1.3\bin"
$env:Path += ";D:\commandline_tools\fzf-0.52.1-windows_amd64"
$env:Path += ";D:\commandline_tools\lf-windows-amd64"
$env:Path += ";D:\commandline_tools\fd-v10.1.0-x86_64-pc-windows-msvc"
$env:Path += ";D:\commandline_tools\ripgrep-14.1.0-x86_64-pc-windows-msvc"
$env:Path += ";D:\commandline_tools\bat-v0.24.0-x86_64-pc-windows-msvc"
$env:Path += ";D:\commandline_tools\zoxide-0.9.4-x86_64-pc-windows-msvc"
$env:Path += ";D:\commandline_tools\eza.exe_x86_64-pc-windows-gnu"
$env:Path += ";D:\commandline_tools\yazi-x86_64-pc-windows-msvc"  # TODO: learn and configure
$env:Path += ";D:\Git\usr\bin"  # yazi needs git's `file.exe`
$env:Path += ";D:\commandline_tools\unarWindows"  # yazi needs `unar`


# oh-my-posh Setup
# ================
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\json.omp.json" | Invoke-Expression

# Aliases
# =======
Set-Alias v nvim


# Proxy Setting
# =============
function setproxy() {
    $env:HTTP_PROXY="127.0.0.1:7890"
    $env:HTTPS_PROXY="127.0.0.1:7890"
    git config --global http.proxy http://127.0.0.1:7890
    git config --global https.proxy http://127.0.0.1:7890
}

function unsetproxy() {
    $env:HTTP_PROXY=$null
    $env:HTTPS_PROXY=$null
    git config --global --unset http.proxy
    git config --global --unset https.proxy
}

# fzf
# ===
$env:RUNEWIDTH_EASTASIAN=0
$env:FZF_DEFAULT_OPTS="--height=40% --layout=reverse --no-scrollbar"
$env:FZF_DEFAULT_COMMAND="fd --type f"

# fzf with a preview window
#
# shortcuts:
# ctrl-o: open the file's directory with file explorer
# ctrl-l: cd into file's directory
# enter: open the file with default application
# ctrl-v: open the file with gvim
function ffp() {
    $output=$(fzf --height=80% --preview 'bat --color=always {}' `
        --bind 'ctrl-b:preview-page-up,ctrl-f:preview-page-down' `
        --preview-window 'nowrap,border-sharp' `
        --expect 'ctrl-o,enter,ctrl-l,ctrl-v')

    $lines=$output -split "`r?`n"
    $filepath=".\"+$lines[1]
    $filedir=[System.IO.Path]::GetDirectoryName($filepath)

    switch($lines[0])
    {
        ctrl-o { ii $filedir }
        ctrl-l { cd $filedir }
        enter { ii $lines[1] }
        ctrl-v { gvim $lines[1] }
    }
}

# fzf find directory
#
# shortcuts:
# ctrl-o: open the directory with file explorer
# ctrl-l: cd into the directory
# enter: open the directory with file explorer
# ctrl-v: open the directory with gvim
function ffd($para) {
    if($para -eq $null) { $output=$(fd -t d | fzf --expect 'ctrl-o,enter,ctrl-l,ctrl-v') }
    else { $output=$(fd -t d | fzf --query $para --expect 'ctrl-o,enter,ctrl-l,ctrl-v') }

    $lines=$output -split "`r?`n"

    switch($lines[0])
    {
        ctrl-o { ii $lines[1] }
        ctrl-l { cd $lines[1] }
        enter { ii $lines[1] }
        ctrl-v { gvim $lines[1] }
    }
}

# fzf find file contents (integrated with ripgrep)
#
# shortcuts:
# ctrl-t: switch between ripgrep mode and fzf mode
# enter: 
#   1) ripgrep mode: confirm query
#   2) fzfmode: open the file with gvim
function ffr() {
    $RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case"
    $CTRL_F_TRANSFORMER=
    "if `"%FZF_PROMPT%`"==`"ripgrep> `" (echo change-prompt^(fzf^> ^)+enable-search+clear-query) " +
    "else if `"%FZF_PROMPT%`"==`"fzf> `" (echo change-prompt^(ripgrep^> ^)+disable-search+clear-query)"
    $ENTER_TRANSFORMER=
    "if `"%FZF_PROMPT%`"==`"ripgrep> `" (echo reload:$RG_PREFIX {q}) " +
    "else if `"%FZF_PROMPT%`"==`"fzf> `" (echo become^(gvim {1} +{2}^))"


    $null | fzf --height=80% --ansi --disabled `
    --prompt 'ripgrep> ' `
    --delimiter : `
    --bind "enter:transform:$ENTER_TRANSFORMER" `
    --bind "ctrl-f:transform:$CTRL_F_TRANSFORMER" `
    --bind "ctrl-v:become(gvim {1} +{2})" `
    --header 'CTRL-F: Switch between ripgrep/fzf' `
    --preview 'bat --color=always {1} --highlight-line {2}' `
    --preview-window 'up,60%,border-bottom,+{2}+3/3,~3'
}


# wezterm utils
# =============
function imgcat($para) { wezterm imgcat --width 30  $para}


# zoxide setup
Invoke-Expression (& { (zoxide init powershell | Out-String) })



$wife_hello=@"
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢁⣿⣿⣿⣿⣿⣷⡘⣆⢿⣿⣿⣇⢸⣿⣿⡇⣼⣿⣶⡌⢧⡒⣸⣿⠟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⣼⣿⣿⣿⣿⣿⣿⣧⠹⡌⠿⠿⠿⠸⠿⠿⠃⠿⢿⣿⣷⠘⣁⠈⢴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣰⣿⣿⡿⠿⠛⢋⠩⠍⠴⠐⠒⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠀⠉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⡟⠰⠛⣋⡥⠔⠚⠉⠁⠀⠀⢀⢀⣤⣤⣤⣤⣤⣤⡤⣤⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⡿⠋⡠⠖⠋⠁⢀⣀⣤⣶⣶⡇⣴⡹⡄⣿⣿⣿⣿⣿⡿⣧⢹⣿⣿⣿⣷⣶⣦⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿
⡿⠿⠟⠛⣿⠠⠀⠁⠀⣠⣴⡖⣿⣿⣿⣿⡿⠰⢟⣃⠀⠘⣿⣿⣯⣿⣧⢻⡌⣩⣍⡛⠿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿
⠶⣢⡴⠂⠙⠀⢠⣶⣿⣿⣿⢡⣿⣿⣿⠋⢀⣾⣿⣿⣧⡀⠹⣿⣿⣿⣿⠸⣧⠈⢿⣿⣶⣾⣿⡙⣿⣆⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿
⠞⠁⢀⣤⡆⠀⣼⣿⣿⡿⡏⢸⣿⣿⣿⢃⣾⣿⣿⣿⣿⣷⡀⢻⣿⣿⣿⡇⢻⡄⣦⠻⣿⣿⣿⣷⡸⣿⣆⠀⠀⠀⠀⠰⣌⢻⣿⣿⣿⣿
⠀⢰⣿⣿⠇⡇⣿⣿⣿⣷⡗⢸⣿⣿⢃⣾⣿⣿⣿⣿⣿⣿⣷⡀⢻⣿⣿⣿⢀⢓⢸⣷⡌⢿⣿⣿⡇⢻⣿⡆⠀⠀⠀⠀⡀⣼⣿⣿⣿⣿
⠀⢸⣿⣿⡇⡇⣿⣿⣿⣿⡇⣼⠟⣡⣿⣿⣿⠿⠟⠛⢛⠻⠿⣿⣄⠹⣿⣿⠸⡧⠀⠛⠻⠆⠛⣿⣿⠘⣿⣿⡀⠀⠐⠃⠀⣿⣿⣿⣿⣿
⣆⢸⣿⣿⡇⢻⣿⣿⣿⣿⡇⠠⣾⣿⠉⠋⠁⠀⠀⠀⠀⠉⠛⢿⣿⣷⡘⣿⡇⠿⠃⠀⠀⠰⣄⠘⠿⡆⢹⣿⡇⢠⣿⣿⡀⠙⣿⣿⣿⣿
⣿⠀⣿⣿⣷⠈⢹⣿⣿⣿⠇⠛⠀⣠⣴⣿⠀⠀⣴⡄⢀⡈⣿⣿⣿⣿⣿⣌⠷⠸⡇⢸⡇⠀⢻⠀⠘⠇⠀⢻⣷⢸⣿⣿⠃⠀⠹⣿⣿⣿
⣿⡇⢸⣿⡿⣿⡘⣿⣿⣿⣆⢠⣌⣿⣿⣿⡄⠀⣋⣁⣜⠀⣿⣿⣿⣿⣿⣿⣦⡀⢳⡀⠉⢀⡾⢧⠀⠀⠀⠈⣿⢸⣿⣿⠀⠀⠀⢹⣿⣿
⣿⣿⠀⢸⣯⣿⣧⠹⣿⣿⣿⡌⢿⣿⠻⢿⣿⣦⣭⢩⣥⣼⣿⣿⣿⣿⣿⣿⣿⣿⣦⣛⣓⣻⣧⣼⣆⠀⠀⠀⠀⣸⣿⡿⠀⠀⠀⠀⢿⣿
⣿⡏⠐⡈⢿⣿⣿⣆⠻⣿⣿⣿⣦⡙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣼⣿⣿⣿⣿⣿⡄⠀⠀⢠⣿⣿⡇⠀⠀⠀⠀⢸⣿
⣿⠁⣾⣿⡌⢿⣿⣿⡄⠙⣿⣏⢉⣛⡂⠙⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⣦⢸⣿⣿⣷⠀⠀⠀⠀⢨⣿
⡿⢸⠻⣿⣿⠂⠻⣿⣷⠀⠀⡙⠎⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢰⡿⢀⢻⣿⣿⣧⣤⣤⣴⣿⣿
⠇⠀⠑⠢⣭⢸⢁⣌⠻⣇⠀⣿⣷⣶⣿⣿⡿⠛⠛⠻⣿⣿⣿⣿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⢸⠇⣾⣧⠹⣿⣿⣿⣿⣿⣿⣿
⠀⠀⣦⣀⡀⢸⢸⣿⣿⢀⡄⠘⢿⣿⠋⠉⠙⢶⡀⢾⣦⣝⢿⣧⠀⣠⡹⣿⣿⣿⣿⣿⣿⣿⡿⢋⣦⠀⣠⣾⣿⣿⣷⡜⢿⣿⣿⣿⣿⣿
⠀⢀⣿⣿⡇⠀⢸⣿⣿⡆⣿⠀⠀⢹⡀⠀⢾⣦⡙⢦⡹⣿⣷⣝⢧⢻⣷⡝⣿⣿⣿⣿⣿⠟⣵⣿⣿⣇⢻⣿⣿⣿⣿⣿⣌⢻⣿⣿⣿⣿
⠀⢸⣿⣿⡇⡟⢸⣿⣿⡇⣿⠄⣆⢸⣧⢸⣮⠻⣿⣶⣝⠊⢻⣿⣧⡀⢻⣿⡜⣿⣿⠟⣡⣾⣿⣿⣿⣿⡆⢿⣿⣿⣿⣿⣿⣆⢻⣿⣿⣿
⠀⣼⣿⣿⡇⡇⣿⣿⣿⣧⢸⡆⣿⢸⣿⣧⠛⠓⢌⠩⣍⢀⣄⢻⣿⣿⡜⣿⣷⠈⠁⠀⢸⣿⣿⣿⣿⣿⣿⡜⣿⣿⣏⢻⣿⣿⣆⢻⣿⣿
⠀⣿⣿⣿⡇⡇⣿⣿⣿⣿⠸⣇⢠⣴⣬⣭⣄⠻⡆⣤⡉⣼⣯⣤⣿⣿⣿⣿⣿⣧⠀⠀⠸⣿⣿⣿⣿⣿⣿⣷⠸⣿⣿⡌⢿⣿⣿⣆⢿⣿
⢸⣿⣿⣿⡇⡇⣿⣿⣿⣿⡆⣿⢸⣿⣿⣿⣿⣧⠀⠻⣷⣽⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⣿⣿⣿⣿⣿⣿⣿⣧⠹⣿⣷⠘⣿⣿⣿⡎⣿
⣼⣿⣿⣿⣇⠀⢹⣿⣿⣿⣧⢸⡆⠛⠿⢿⣿⣿⡆⢣⡜⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠸⣿⣿⣿⣿⣿⣿⣿⡆⠹⣿⡆⢹⣿⣿⣿⡘
⣿⣿⣿⠿⠋⠀⢸⣿⠸⣿⣿⣿⣧⠀⠀⠀⠀⠉⠛⠈⠻⢎⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠻⢿⣿⣿⣿⣿⣿⣿⡀⢻⣧⠈⣿⣿⣿⣧
"@
$pwsh_processes_num=Get-Process -Name "pwsh" | Measure-Object -Line | Select-Object -ExpandProperty Lines
if($pwsh_processes_num -eq 1) {
    cls
    Write-Host $wife_hello -ForegroundColor Red
}


