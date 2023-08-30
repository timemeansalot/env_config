#################################################################################################
# 1. Optional: setup VPN for fast download
#################################################################################################
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
# !!! you have to make sure you can use `git clone` from github

#################################################################################################
# 2. install pre-requirements
#################################################################################################
# Optional: install nvidia-driver
# sudo ubuntu-drivers autoinstall && sudo reboot now
# install necessary library
sudo apt update
sudo apt install proxychains4 shadowsocks-libev vim wget git tmux make gcc time curl libreadline6-dev libsdl2-dev gcc-riscv64-linux-gnu openjdk-11-jre zlib1g-dev device-tree-compiler flex autoconf bison sqlite3 libsqlite3-dev -y
sudo apt-get install perl python3 make autoconf g++ flex bison clang -y
sudo apt-get install libgoogle-perftools-dev numactl perl-doc -y
sudo apt-get install libfl2 -y # Ubuntu only (ignore if gives error)
sudo apt-get install libfl-dev -y # Ubuntu only (ignore if gives error)
sudo apt-get install zlibc zlib1g zlib1g-dev -y  # Ubuntu only (ignore if gives error)

sudo apt-get install help2man perl python3 make autoconf g++ flex bison ccache -y
sudo apt-get install libgoogle-perftools-dev numactl perl-doc -y
sudo apt-get install libfl2 -y     # Ubuntu only (ignore if gives error)
sudo apt-get install libfl-dev -y  # Ubuntu only (ignore if gives error)
sudo apt-get install zlibc zlib1g zlib1g-dev -y  # Ubuntu only (ignore if gives error)
sudo apt-get install help2man -y
sudo apt-get install build-essential -y    # build-essential packages, include binary utilities, gcc, make, and so on
sudo apt-get install man -y                # on-line reference manual
sudo apt-get install gcc-doc -y            # on-line reference manual for gcc
sudo apt-get install gdb -y                # GNU debugger
sudo apt-get install git -y                # revision control system
sudo apt-get install libreadline-dev -y    # a library used later
sudo apt-get install libsdl2-dev -y        # a library used later
sudo apt-get install llvm llvm-dev -y      # llvm project, which contains libraries used later
# sudo apt-get install llvm-11 llvm-11-dev # only for ubuntu20.04
# instal zsh git
```bash
sudo apt install zsh -y
chsh -s /usr/bin/zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
p10k configure
```
# config zsh from my config files
sudo apt install stow -y
cd ~
git clone git@github.com:timemeansalot/env_config.git .env_config
cd .env_config
stow nvim && stow tmux && stow zsh


#################################################################################################
# 3. install verilator 
#################################################################################################
# https://verilator.org/guide/latest/install.html
sudo apt-get install git perl python3 make autoconf g++ flex bison clang -y
sudo apt-get install libgoogle-perftools-dev numactl perl-doc -y
sudo apt-get install libfl2 -y # Ubuntu only (ignore if gives error)
sudo apt-get install libfl-dev -y # Ubuntu only (ignore if gives error)
sudo apt-get install zlibc zlib1g zlib1g-dev -y  # Ubuntu only (ignore if gives error)

git clone https://github.com/verilator/verilator
# Every time you need to build:
unset VERILATOR_ROOT  # For bash
cd verilator
# XiangShan uses Verilator v4.218
# git checkout v4.218
autoconf        # Create ./configure script
# Configure and create Makefile
# ./configure CC=clang CXX=clang++ # We use clang as default compiler
./configure 
make -j8        # Build Verilator itself
sudo make install
verilator --version

# install verilator
sudo apt-get install verilator -y

#################################################################################################
# 4. install riscv toolchain
#################################################################################################
sudo apt-get install autoconf automake autotools-dev curl python3 python3-pip libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev ninja-build git cmake libglib2.0-dev -y
git clone https://github.com/riscv/riscv-gnu-toolchain
cd riscv-gnu-toolchain
# git submodule update --init --recursive
./configure --prefix=/opt/riscv
# compile newlib
make -j `nproc`
# compile riscv-toolchain
make linux -j `nproc`


#################################################################################################
# 5. install nodejs
#################################################################################################
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
source ~/.zshrc
# nvm ls-remote
nvm install 18
source ~/.zshrc
npm config set registry https://registry.npm.taobao.org
# install hexo
npm install hexo -g
npm fund
npm install
sudo apt-get install pandoc -y # used by hexo

#################################################################################################
# 6. install tmux, neovim
#################################################################################################

# install neovim
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
mkdir ~/app
tar -xvzf nvim-linux64.tar.gz -C ~/app
sudo ln -s ~/app/nvim-linux64/bin/nvim /usr/bin/nvim
nvim --version
# config neovim
sudo apt-get install ripgrep -y
sudo apt remove cmdtest
sudo apt remove yarn
npm install -g prettier # used by neovim
npm install picgo -g # install picgo-core
picgo set uploader
npm install -g yarn
cd ~/.local/share/nvim/site/pack/packer/start/
git clone https://github.com/iamcco/markdown-preview.nvim.git
cd markdown-preview.nvim
yarn install
yarn build

# install tmux
sudo apt-get install tmux -y
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # tmux package manager

#################################################################################################
# 7. clone my useful github repos
################################################################################################
mkdir -p ~/Developer/git_repos
cd ~/Developer/git_repos
git clone git@github.com:timemeansalot/SourceFiles.git
git clone git@github.com:ChipDesign/FAST_INTR_CPU.git 
git clone git@github.com:oscc-ip/vga.git
