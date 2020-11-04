#! /bin/bash

set -e

name=${1:-actev}

cd $(cd $(dirname $0); pwd)
CONDA_DIR=$(dirname $CONDA_EXE)/..
source $CONDA_DIR/etc/profile.d/conda.sh

sudo apt install -y gcc g++ pkg-config libgl1-mesa-dev
CC="cc -mavx2" conda env create -f environment.yml -n $name

conda activate $name
./update_ffmpeg.sh
