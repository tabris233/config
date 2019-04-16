#!/bin/sh
########################################
# this is need TODO
########################################

exit


# create install array

install=()

# add element to array
echo "Select Packages to Install?(eg: 1 2 3, 1-3, ^4)"

for dir in ./*; do
    if test -d $dir
        echo $dir
    fi
done


i=0
for dir in ./*; do
    if test -d $dir
        i++
        echo $dir
    fi
done


