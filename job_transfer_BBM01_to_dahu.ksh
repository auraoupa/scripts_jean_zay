#!/bin/bash
################################
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -J transfer_NANUK12
#SBATCH -o transfer_NANUK12_%J.out
#SBATCH -e transfer_NANUK12_%J.err
#SBATCH --time=02:00:00
#SBATCH --account=cli@cpu
#SBATCH --exclusive
#SBATCH --qos=qos_cpu-dev
################################

ulimit -s unlimited

CONFIG=NANUK12
CASE=BBM01

cd /gpfsstore/rech/cli/rote001/${CONFIG}/${CONFIG}_ICE-${CASE}-S

scp */*nc4 cargo.ciment:/summer/sasip/model-outputs/${CONFIG}/${CONFIG}_ICE-${CASE}-S/.

