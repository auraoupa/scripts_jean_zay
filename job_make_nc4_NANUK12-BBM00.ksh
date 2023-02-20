#!/bin/bash
################################
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -J nc3tonc4
#SBATCH -o out_nc3tonc4_%J.out
#SBATCH -e err_nc3tonc4_%J.err
#SBATCH --time=02:00:00
#SBATCH --account=cli@cpu
#SBATCH --exclusive
#SBATCH --qos=qos_cpu-dev
################################

ulimit -s unlimited

CONFIG=NANUK12
CASE=BBM00

cd /gpfswork/rech/eee/rote001/git/scripts-jean-zay

./script_make_nc4_outputs.ksh $CONFIG $CASE
