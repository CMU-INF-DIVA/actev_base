#! /bin/bash

set -e

name=${1:-actev}

if $(id | grep sudo &> /dev/null); then
    sudo apt install -y git gcc g++ pkg-config libgl1-mesa-dev
fi

cd $(cd $(dirname $0); pwd)
CONDA_DIR=$(dirname $CONDA_EXE)/..
source $CONDA_DIR/etc/profile.d/conda.sh
conda update -n base -c defaults conda -y

CC="cc -mavx2" conda env create -f environment.yml -n $name

conda activate $name
./update_ffmpeg.sh
