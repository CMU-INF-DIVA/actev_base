#! /bin/bash

cd $(cd $(dirname $0); pwd)
source $(dirname $CONDA_EXE)/../etc/profile.d/conda.sh

while [ $CONDA_DEFAULT_ENV != base ];
do
    conda deactivate
done

sudo apt install -y gcc g++ pkg-config libgl1-mesa-dev
CC="cc -mavx2" \
PKG_CONFIG_PATH="$CONDA_PREFIX/envs/actev/lib/pkgconfig:$PKG_CONFIG_PATH" \
conda env create -f environment.yml
