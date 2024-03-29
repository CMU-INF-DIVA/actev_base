# ActEV Base Environment

[![Docker Image](https://github.com/CMU-INF-DIVA/actev_base/actions/workflows/docker-image.yml/badge.svg)](https://github.com/CMU-INF-DIVA/actev_base/actions/workflows/docker-image.yml)

Author: Lijun Yu

Email: lijun@lj-y.com

Base image for [ActEV SDL](https://actev.nist.gov/sdl) submission of CMU.

## Environment

* [Python](https://www.python.org) 3.7
* [CUDA](https://developer.nvidia.com/cuda-downloads) 10.1
* [PyTorch](https://pytorch.org) 1.6
* [PyTorch Lightning](https://github.com/PyTorchLightning/pytorch-lightning)
* [OpenCV](https://opencv.org)
* [Open3D](http://www.open3d.org/)
* [Anaconda](https://docs.anaconda.com/anaconda/packages/pkg-docs/)
* [Detectron2](https://github.com/facebookresearch/detectron2)
* [Pyturbo](https://github.com/CMU-INF-DIVA/pyturbo)
* [AVI-R](https://github.com/CMU-INF-DIVA/avi-r) with [FFmpeg](https://ffmpeg.org) 4.3.1
* Dependencies of [ActEV_Scorer](https://github.com/usnistgov/ActEV_Scorer)

## Usage

### Docker Image

[Github Packages](https://github.com/orgs/CMU-INF-DIVA/packages/container/package/actev_base)

```sh
docker pull ghcr.io/cmu-inf-diva/actev_base

# Test it
docker run -it --rm --gpus all --ipc host ghcr.io/cmu-inf-diva/actev_base \
    bash -ic "python -c 'import torch; assert torch.cuda.is_available()'; nvidia-smi"
```

Container directory structure

* `/app` - Work directory
  * `env` - Python environment
  * `core` - System implementation
  * `data` - Mount point for data

### Local Development

Install [miniconda](https://conda.io/en/latest/miniconda.html), then run

```sh
./setup.sh [<name>] # name defaults to `actev`
```

If you want to patch `PyTorch` with this [PR](https://github.com/pytorch/pytorch/pull/40801), run

```sh
conda activate <name>
./patch_pytorch.sh
```
