#!/bin/sh

# only config file option,
# default: true
# if it's flase, this script will sync plugin file
# if .....true , this script won't sync plugin file
OnlyConfigFile=$1

SyncConky (){
    echo "(${FUNCNAME[@]})"
    if test -e ~/.conkyrc  ;then
        echo "cp ~/.conkyrc ./conky/"
        cp ~/.conkyrc ./conky/
    fi
}
SyncFont  (){
    echo "(${FUNCNAME[@]})"
}
SyncNeovim(){
    echo "(${FUNCNAME[@]})"
    if $OnlyConfigFile == true && test -e ~/.config/nvim/init.vim; then
        echo "cp ~/.config/nvim/init.vim ./neovim"
        cp ~/.config/nvim/init.vim ./neovim
    elif test -d ~/.config/nvim ;then
        echo "rm -rf ./neovim/nvim && cp -r ~/.config/nvim ./neovim"
        rm -rf ./neovim/nvim
        cp -r ~/.config/nvim ./neovim
    fi
}
SyncTmux  (){
    # TODO
    echo "(${FUNCNAME[@]})"
    return 
    if $OnlyConfigFile == true && test -e ~/.tmuxinator; then
        echo "cp ~/.config/nvim/init.vim ./neovim"
        cp ~/.config/nvim/init.vim ./neovim
    elif test -d ~/.config/nvim ;then
        echo "cp -r ~/.config/nvim ./neovim"
        cp -r ~/.config/nvim ./neovim
    fi

}
Syncwtf   (){
    echo "(${FUNCNAME[@]})"

    if $OnlyConfigFile == true && test -e ~/.config/wtf; then
        echo "cp ~/.config/wtf/config.yml ./wtf"
        cp ~/.config/wtf/config.yml ./wtf
    elif test -d ~/.config/wtf;then
        echo "rm -rf ./wtf/wtf &&  cp -r ~/.config/wtf ./wtf"
        rm -rf ./wtf/wtf
        cp -r ~/.config/wtf ./wtf
    fi
}
SyncZsh   (){
    echo "(${FUNCNAME[@]})"

    if test -d ~/.zshrc;then
        echo "cp ~/.zshrc ./zsh"
        cp ~/.zshrc ./zsh
    fi

    if $OnlyConfigFile == true ; then
        return
    else
        if test -d ~/.tmuxinator;then
            echo "rm -rf ./zsh/.tmuxinator && cp -r ~/.config/nvim/init.vim ./zsh"
            rm -rf ./zsh/.tmuxinator
            cp -r ~/.tmuxinator ./zsh
        fi
        if test -d ~/.oh-my-zsh;then
            echo "rm -rf ./zsh/.oh-my-zsh && cp -r ~/.oh-my-zsh ./zsh"
            rm -rf ./zsh/.oh-my-zsh
            cp -r ~/.oh-my-zsh ./zsh
        fi
    fi
}
#SyncConky(){echo "${FUNCNAME[@]})"}

start(){
    SyncConky
    SyncFont
    SyncNeovim
    SyncTmux
    Syncwtf
    SyncZsh
}
start
