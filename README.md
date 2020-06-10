# ActEV Base Environment

![Build and Publish Docker Image](https://github.com/Lijun-Yu/actev_base/workflows/Build%20and%20Publish%20Docker%20Image/badge.svg) Version 0.1

Author: Lijun Yu

Email: lijun@lj-y.com

Base image for [ActEV SDL](https://actev.nist.gov/sdl) submission of CMU.

## Environment

* [python](https://www.python.org) 3.8
* [cuda](https://developer.nvidia.com/cuda-downloads) 10.2
* [pytorch](https://pytorch.org) 1.5
* [anaconda](https://docs.anaconda.com/anaconda/packages/pkg-docs/)
* [detectron2](https://github.com/facebookresearch/detectron2)
* [py-turbo](https://github.com/Lijun-Yu/pyturbo)
* [avi-r](https://github.com/Lijun-Yu/avi-r)

## Usage

### Docker Image

```sh
docker pull docker.pkg.github.com/lijun-yu/actev_base/actev_base:latest
```

See [docker image](https://github.com/Lijun-Yu/actev_base/packages/262958).

### Local Development

Install [miniconda](https://conda.io/en/latest/miniconda.html), then run

```sh
conda env create -f environment.yml
```
