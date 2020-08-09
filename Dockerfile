FROM nvidia/cuda:10.1-cudnn7-runtime

ENV DEBIAN_FRONTEND=noninteractive \
    FVCORE_CACHE="/app/cache" \
    PATH="/opt/conda/bin:$PATH" \
    online=true
SHELL ["/bin/bash", "-c"]
WORKDIR /app

RUN apt-get -qq update \
    && apt-get -qq -y install wget \
    && wget -q https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh \
    && bash miniconda.sh -bp /opt/conda \
    && rm miniconda.sh \
    && ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh \
    && echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc \
    && apt-get -qq autoremove \
    && apt-get -qq clean

ADD environment.yml requirements.txt ./
RUN apt-get -qq -y install gcc g++ \
    && conda env create -f environment.yml -p /app/env \
    && echo "conda activate /app/env" >> ~/.bashrc \
    && conda clean -ayq \
    && /app/env/bin/pip cache purge \
    && apt-get -qq remove gcc g++ \
    && apt-get -qq autoremove \
    && apt-get -qq clean
