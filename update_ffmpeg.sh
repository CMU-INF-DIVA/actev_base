#! /bin/bash

set -e

conda install "ffmpeg>=4.3.1" -c conda-forge -y
conda env config vars set FFMPEG_BINARY=auto-detect
export PKG_CONFIG_PATH="$CONDA_PREFIX/lib/pkgconfig:$PKG_CONFIG_PATH"
pip uninstall -y av
pip install av --no-binary av
