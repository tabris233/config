#!/bin/sh
########################################
# this is need 
########################################


function start(){
    # create install array
    
    install=()
    
    # add element to array
    echo "Select Packages to Install?(eg: 1 2 3, 1-3, ^4)"
    # input params


    i=0
    for dir in ./*; do
        if [ -d $dir ]; then
            let i
            echo "$i. $dir"
            if [ -e $dir/install.sh ]; then
                echo "$dir/install.sh --<<"
                source $dir/install.sh "$dir/install.sh"
            fi
        fi
    done

    i=0
    for dir in ./*; do
        if [ -d $dir ]; then
            let i
            echo $dir
            if [ -e $dir/install.sh ]; then
                echo "$dir/install.sh --<<"
                source $dir/install.sh "$dir/install.sh"
            fi
        fi
    done
    
}

start
