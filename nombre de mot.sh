#!/bin/bash

files=`find . -maxdepth 1 -type f | grep -o "[^./][^/]*"`
total=0

for file in `echo $files`
do
    wcount=`cat $file | wc -w`
    echo $file : contient $wcount mots
    ((total+=wcount))
done

echo Total : $total