#!/bin/sh

#TODO

if test -d ~/.config/wtf;then
    ;
else
    mkdir -p ~/.config/wtf
fi
cp ./config.yml ~/.config/wtf/
cp ./todo.yml   ~/.config/wtf/

