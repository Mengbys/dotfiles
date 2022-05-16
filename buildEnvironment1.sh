#!/usr/bin/bash

echo -e "\033[32m****************************************\033[0m"
echo -e "\033[32m创建工作目录...\033[0m"
echo -e "\033[32m****************************************\033[0m"
mkdir -p ~/workspace/github
mkdir -p ~/workspace/test

echo -e "\033[32m****************************************\033[0m"
echo -e "\033[32m添加国内软件源...\033[0m"
echo -e "\033[32m****************************************\033[0m"
sudo sed -i '$a\
\
# 添加阿里源\
deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse\
deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse\
deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse\
deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse\
deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse\
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse\
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse\
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse\
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse' /etc/apt/sources.list

echo -e "\033[32m****************************************\033[0m"
echo -e "\033[32m修改.bashrc...\033[0m"
echo -e "\033[32m****************************************\033[0m"
# fzf
sed -i '$a\
\
# fzf\
# enable fzf keybindings and auto-completion\
source /usr/share/doc/fzf/examples/key-bindings.bash\
source /usr/share/doc/fzf/examples/completion.bash\
export FZF_DEFAULT_COMMAND="find -L"\
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse"\
alias fzfp="fzf --height=40% --layout=reverse --preview '\''(cat {} || tree -C {}) 2> /dev/null | head -200'\'' --preview-window=:wrap"' ~/.bashrc
# fff
sed -i '$a\
\
# fff\
export FFF_HIDDEN=0\
fffq() {\
  fff "$@"\
  cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"\
}' ~/.bashrc
# python3
sed -i '$a\
\
# python3 bin\
PATH=$PATH:$HOME/.local/bin' ~/.bashrc

