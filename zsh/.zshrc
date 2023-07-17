# config for Linux only
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions web-search)
source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# nvm using china repo
export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node
export NVM_IOJS_ORG_MIRROR=http://npm.taobao.org/mirrors/iojs


# Java for Ubuntu 
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH:.

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/fujie/app/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/fujie/app/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/fujie/app/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/fujie/app/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# conda activate chisel


# gtkwave & Perl Switch: allow `gtkwave` command works fine in terminal
PATH="/Users/fujie/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/fujie/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/fujie/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/fujie/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/fujie/perl5"; export PERL_MM_OPT;

alias gktwave="/Applications/gtkwave.app/Contents/Resources/bin/gtkwave"
alias proxy="export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890"
alias unproxy="unset http_proxy && unset https_proxy && unset all_proxy"
alias c="clear"
alias szsh='source ~/.zshrc'
alias gs='git status'
alias gm='git merge'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gp='git push'
alias gch='git checkout'
alias gcb='git checkout -b'
alias gbd='git branch --delete'
alias gbD='git branch --delete --force'
alias gitlog='git log --all --graph --pretty=format:"%Cred%h%Creset %C(bold blue)%an%Creset %s %Cgreen(%cr) %Creset" --abbrev-commit'
eval $(thefuck --alias)
alias pst="cd ~/Developer/git_repos/SourceFiles/hexo-site/source/_posts/"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# color scheme, Ubuntu Only
# eval `dircolors /home/fujie/.dir_colors/dircolors`
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# long arch
# export CHIPLAB_HOME=/home/fujie/Developer/git_repos/chiplab
# export PATH=${CHIPLAB_HOME}/toolchains/loongarch32r-linux-gnusf-2022-05-20/bin/:$PATH 
# export CPATH=.:/usr/include/SDL2/:$CPATH
