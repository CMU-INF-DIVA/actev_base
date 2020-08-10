# ActEV Base Environment

[![](https://images.microbadger.com/badges/version/cmuinfdiva/actev_base.svg)](https://microbadger.com/images/cmuinfdiva/actev_base "Get your own version badge on microbadger.com")

Author: Lijun Yu

Email: lijun@lj-y.com

Base image for [ActEV SDL](https://actev.nist.gov/sdl) submission of CMU.

## Environment

* [Python](https://www.python.org) 3.7
* [CUDA](https://developer.nvidia.com/cuda-downloads) 10.1
* [PyTorch](https://pytorch.org) 1.6
* [OpenCV](https://opencv.org)
* [Open3D](http://www.open3d.org/)
* [Anaconda](https://docs.anaconda.com/anaconda/packages/pkg-docs/)
* [Detectron2](https://github.com/facebookresearch/detectron2)
* [Pyturbo](https://github.com/Lijun-Yu/pyturbo)
* [AVI-R](https://github.com/Lijun-Yu/avi-r)
* Dependencies of [ActEV_Scorer](https://github.com/usnistgov/ActEV_Scorer)

## Usage

### Docker Image

[DockerHub](https://hub.docker.com/r/cmuinfdiva/actev_base)

```sh
docker pull cmuinfdiva/actev_base

# Test it
docker run -it --rm --gpus all --ipc host cmuinfdiva/actev_base bash -ic "python -c 'import torch; assert torch.cuda.is_available()'; nvidia-smi"
```

Container directory structure

* `/app` - Work directory
  * `env` - Python environment
  * `core` - System implementation
  * `data` - Mount point for data

### Local Development

Install [miniconda](https://conda.io/en/latest/miniconda.html), then run

```sh
conda env create -f environment.yml
```
