#! /bin/bash

set -e

conda install numpy ninja pyyaml mkl mkl-include setuptools cmake cffi typing_extensions future six requests dataclasses -y
conda install -c pytorch magma-cuda101 -y

git clone --recursive https://github.com/pytorch/pytorch
cd pytorch
git fetch origin pull/40801/head:local
git checkout local

export CMAKE_PREFIX_PATH=${CONDA_PREFIX:-"$(dirname $(which conda))/../"}
python setup.py install

pip uninstall detectron2 -y
pip install git+https://github.com/facebookresearch/detectron2.git

cd ..
rm -rf pytorch
