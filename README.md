# ActEV Base Environment

![Build and Publish Docker Image](https://github.com/Lijun-Yu/actev_base/workflows/Build%20and%20Publish%20Docker%20Image/badge.svg) Version 0.3

Author: Lijun Yu

Email: lijun@lj-y.com

Base image for [ActEV SDL](https://actev.nist.gov/sdl) submission of CMU.

## Environment

* [python](https://www.python.org) 3.7
* [cuda](https://developer.nvidia.com/cuda-downloads) 10.1
* [pytorch](https://pytorch.org)
* [opencv](https://opencv.org)
* [open3d](http://www.open3d.org/)
* [anaconda](https://docs.anaconda.com/anaconda/packages/pkg-docs/)
* [detectron2](https://github.com/facebookresearch/detectron2)
* [py-turbo](https://github.com/Lijun-Yu/pyturbo)
* [avi-r](https://github.com/Lijun-Yu/avi-r)
* Dependencies of [ActEV_Scorer](https://github.com/usnistgov/ActEV_Scorer)

## Usage

### Docker Image

```sh
docker pull docker.pkg.github.com/cmu-inf-diva/actev_base/actev_base:latest
```

See [docker image](https://github.com/CMU-INF-DIVA/actev_base/packages/262958).

Test it

```sh
docker run -it --gpus all --ipc host --rm docker.pkg.github.com/cmu-inf-diva/actev_base/actev_base:latest bash -ic "python -c 'import torch; assert torch.cuda.is_available()'; nvidia-smi"
```

### Local Development

Install [miniconda](https://conda.io/en/latest/miniconda.html), then run

```sh
conda env create -f environment.yml
```
