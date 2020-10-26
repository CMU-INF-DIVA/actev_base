#! /bin/bash

set -e

cd $(cd $(dirname $0); pwd)
CONDA_DIR=$(dirname $CONDA_EXE)/..
source $CONDA_DIR/etc/profile.d/conda.sh

sudo apt install -y gcc g++ pkg-config libgl1-mesa-dev
PKG_CONFIG_PATH="$CONDA_DIR/envs/actev/lib/pkgconfig:$PKG_CONFIG_PATH" \
    CC="cc -mavx2" \
    conda env create -f environment.yml
conda env config vars set FFMPEG_BINARY=auto-detect -n actev
