#!/usr/bin/bash

# apt-get安装的软件包: subversion curl wget make cmake tree fzf python3.9-dev python3-pip libncurses5-dev astyle universal-ctags
# pip安装的软件包: flake8 autopep8
# 成败取决于网络
echo -e "\033[32m****************************************\033[0m"
echo -e "\033[32mapt-get安装软件包...\033[0m"
echo -e "\033[32m****************************************\033[0m"
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install git subversion curl wget make cmake tree fzf python3.9-dev python3-pip libncurses5-dev astyle universal-ctags -y

echo -e "\033[32m****************************************\033[0m"
echo -e "\033[32m设置python3和pip安装软件包...\033[0m"
echo -e "\033[32m****************************************\033[0m"
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 31
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 30
# 解决安装高版本python之后缺失apt_pkg包的问题
sudo touch /usr/lib/python3/dist-packages/apt_pkg.so
sudo cp /usr/lib/python3/dist-packages/apt_pkg.cpython-38-x86_64-linux-gnu.so /usr/lib/python3/dist-packages/apt_pkg.so
pip3 install flake8 autopep8

echo -e "\033[32m****************************************\033[0m"
echo -e "\033[32m通过git安装fff...\033[0m"
echo -e "\033[32m****************************************\033[0m"
cd ~/workspace/github/
until git clone https://hub.fastgit.org/dylanaraps/fff.git; do
	echo -e "\033[31mgit clone发生错误, 重试...\033[0m"
done
cd fff
sudo make install

echo -e "\033[32m****************************************\033[0m"
echo -e "\033[32m通过git安装vim8.2...\033[0m"
echo -e "\033[32m****************************************\033[0m"
echo -e "\033[36m下载vim源码...\033[0m"
cd ~/workspace/github/
until git clone https://hub.fastgit.org/vim/vim.git; do
	echo -e "\033[31mgit clone发生错误, 重试...\033[0m"
done
echo -e "\033[36m编译并安装vim...\033[0m"
cd vim/src/
./configure \
	--enable-python3interp=yes \
	--with-python3-config-dir=/usr/lib/python3.9/config-3.9-x86_64-linux-gnu
make
sudo make install
sudo update-alternatives --install /usr/bin/vim vim /usr/local/bin/vim 31
echo -e "\033[36m传输文件plug.vim, .vimrc...\033[0m"
until curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://ghproxy.com/https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; do
	echo -e "\033[31mcurl发生错误, 重试...\033[0m"
done
until curl -o ~/.vimrc https://ghproxy.com/https://raw.githubusercontent.com/Mengbys/Transfer-Station/main/.vimrc; do
	echo -e "\033[31mcurl发生错误, 重试...\033[0m"
done
echo -e "\033[36m传输文件mycoolsnippets...\033[0m"
until svn checkout \
	https://hub.fastgit.org/Mengbys/Transfer-Station/trunk/mycoolsnippets ~/.vim/mycoolsnippets; do
	echo -e "\033[31msvn发生错误, 重试...\033[0m"
done
echo -e "\033[36m安装ycm...\033[0m"
mkdir -p ~/.vim/plugged
until wget -O ~/YouCompleteMe.tar.gz "http://106.53.74.248:8888/YouCompleteMe.tar.gz"; do
	echo -e "\033[31mwget发生错误, 重试...\033[0m"
done
tar -zxvf ~/YouCompleteMe.tar.gz -C ~/.vim/plugged
rm -f ~/YouCompleteMe.tar.gz
cd ~/.vim/plugged/YouCompleteMe
until python3 install.py --clangd-completer; do
	echo -e "\033[31m执行install.py发生错误, 重试...\033[0m"
done
cp ~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py ~/.ycm_extra_conf.py


