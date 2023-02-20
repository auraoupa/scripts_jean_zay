#!/bin/bash
################################
#SBATCH -N 1
#SBATCH -n 10
#SBATCH -J nc3tonc4
#SBATCH -o out_nc3tonc4_%J.out
#SBATCH -e err_nc3tonc4_%J.err
#SBATCH --time=02:00:00
#SBATCH --account=cli@cpu
#SBATCH --exclusive
#SBATCH --qos=qos_cpu-dev
################################

ulimit -s unlimited

CONFIG=$1
CASE=$2

cd /gpfsstore/rech/cli/rote001/${CONFIG}/${CONFIG}_ICE-${CASE}-S

for file in $(ls */*nc); do
	fileo=$(echo $file | sed "s/.nc/.nc4")
	if  [ ! -f  $fileo ]; then
		nc3tonc4 -o $file ${file}4
	fi
done

