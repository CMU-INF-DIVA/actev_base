#! /bin/bash

set -e

cd $(cd $(dirname $0); pwd)
CONDA_DIR=$(dirname $CONDA_EXE)/..
source $CONDA_DIR/etc/profile.d/conda.sh

sudo apt install -y gcc g++ pkg-config libgl1-mesa-dev
CC="cc -mavx2" conda env create -f environment.yml

conda activate actev
./update_ffmpeg.sh
