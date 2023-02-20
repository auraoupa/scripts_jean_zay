#!/bin/bash

ulimit -s unlimited

CONFIG=$1
CASE=$2

cd /gpfsstore/rech/cli/rote001/${CONFIG}/${CONFIG}_ICE-${CASE}-S

for file in $(ls */*nc); do
	fileo=$(echo $file | sed "s/.nc/.nc4/g")
	if  [ ! -f  $fileo ]; then
		nc3tonc4 -o $file ${file}4
	fi
done

