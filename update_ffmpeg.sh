#! /bin/bash

set -e

conda install "ffmpeg==4.3.1=h03821db_2" -c conda-forge -y
conda env config vars set FFMPEG_BINARY=auto-detect
export PKG_CONFIG_PATH="$CONDA_PREFIX/lib/pkgconfig:$PKG_CONFIG_PATH"
pip uninstall -y av
pip install "av<8.0.3" --no-binary av
