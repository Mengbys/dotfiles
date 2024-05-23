$env:Path += ";C:\disk\7-Zip"
$env:Path += ";C:\disk\powershell7\7"
$env:Path += ";C:\disk\Vim\vim91"
$env:Path += ";C:\disk\neovim\bin"
$env:Path += ";C:\disk\mingw64\bin"
$env:Path += ";C:\disk\clangd_18.1.3\bin"
$env:Path += ";C:\disk\lua-language-server-3.9.1\bin"
$env:Path += ";C:\disk\fzf-0.52.1-windows_amd64"

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\json.omp.json" | Invoke-Expression

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
