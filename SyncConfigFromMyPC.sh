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
    if OnlyConfigFile == true && test -e ~/.config/nvim/init.vim; then
        echo "cp ~/.config/nvim/init.vim ./neovim"
        cp ~/.config/nvim/init.vim ./neovim
    elif test -d ~/.config/nvim ;then
        echo "cp ~/.config/nvim ./neovim"
        cp ~/.config/nvim ./neovim
    fi
}
SyncTmux  (){
    # TODO
    echo "(${FUNCNAME[@]})"

    if OnlyConfigFile == true && test -e ~/.config/nvim/init.vim; then
        echo "cp ~/.config/nvim/init.vim ./neovim"
        cp ~/.config/nvim/init.vim ./neovim
    elif test -d ~/.config/nvim ;then
        echo "cp ~/.config/nvim ./neovim"
        cp ~/.config/nvim ./neovim
    fi

}
Syncwtf   (){
    echo "(${FUNCNAME[@]})"

    if OnlyConfigFile == true && test -e ~/.config/wtf; then
        echo "cp ~/.config/wtf/config.yml ./wtf"
        cp ~/.config/wtf/config.yml ./wtf
    elif test -d ~/.config/wtf;then
        echo "cp ~/.config/wtf ./wtf"
        cp ~/.config/wtf ./wtf
    fi
}
SyncZsh   (){
    echo "(${FUNCNAME[@]})"

    if test -d ~/.zshrc;then
        echo "cp ~/.zshrc ./zsh"
        cp ~/.zshrc ./zsh
    fi

    if OnlyConfigFile == true ; then
        return
    else
        if test -d ~/.tmuxinator;then
            echo "cp ~/.config/nvim/init.vim ./zsh"
            cp ~/.tmuxinator ./zsh
        fi
        if test -d ~/.oh-my-zsh;then
            echo "cp ~/.oh-my-zsh ./zsh"
            cp ~/.oh-my-zsh ./zsh
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
