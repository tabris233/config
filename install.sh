#!/bin/sh
########################################
# this is need 
########################################

InstallConky (){
    echo "(${FUNCNAME[@]})"
    source ./conky/install.sh
}

InstallFont  (){
    echo "(${FUNCNAME[@]})"
    source ./font/install.sh
}

InstallNeovim(){
    echo "(${FUNCNAME[@]})"
    source ./neovim/install.sh
}

InstallTmux  (){
    echo "(${FUNCNAME[@]})"
    source ./tmux/install.sh
}

Installwtf   (){
    echo "(${FUNCNAME[@]})"
    source ./wtf/install.sh
}

InstallZsh   (){
    echo "(${FUNCNAME[@]})"
    source ./zsh/install.sh
}

function start(){

    InstallConky
    InstallFont
    InstallNeovim
    InstallTmux
    Installwtf
    InstallZsh

}


#function start(){
#    # create install array
#    
#    install=()
#    
#    # add element to array
#    echo "Select Packages to Install?(eg: 1 2 3, 1-3, ^4)"
#    
#    for dir in ./*; do
#        if test -d $dir
#            echo $dir
#        fi
#    done
#    
#    
#    i=0
#    for dir in ./*; do
#        if test -d $dir
#            i++
#            echo $dir
#        fi
#    done
#    
#}

start
