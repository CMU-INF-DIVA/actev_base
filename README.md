# ActEV Base Environment

![Build and Publish Docker Image](https://github.com/Lijun-Yu/actev_base/workflows/Build%20and%20Publish%20Docker%20Image/badge.svg) Version 0.3

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

### [docker image](https://github.com/CMU-INF-DIVA/actev_base/packages/262958)

```sh
image=docker.pkg.github.com/cmu-inf-diva/actev_base/actev_base:latest
docker pull $image

# Test it
docker run -it --rm --gpus all --ipc host $image bash -ic "python -c 'import torch; assert torch.cuda.is_available()'; nvidia-smi"
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
