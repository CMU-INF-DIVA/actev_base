FROM nvidia/cuda:10.1-cudnn7-runtime

SHELL ["/bin/bash", "-c"]
WORKDIR /app
VOLUME /app/data
LABEL maintainer="Lijun Yu @ CMU INF Lab"

RUN apt-get -qq update && \
    apt-get -qq -y install wget && \
    wget -q https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh && \
    bash miniconda.sh -bp /opt/conda && \
    rm miniconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    apt-get -qq autoremove && \
    apt-get -qq clean

ADD . env_build
RUN apt-get -qq update && \
    apt-get -qq -y install git gcc g++ pkg-config libgl1-mesa-dev && \
    source /opt/conda/etc/profile.d/conda.sh && \
    conda update -y -n base -c defaults conda && \
    CC="cc -mavx2" conda env create \
        -f env_build/environment.yml -p /app/env && \
    conda activate /app/env && \
    env_build/update_ffmpeg.sh && \
    echo "conda activate /app/env" >> ~/.bashrc && \
    conda clean -ayq && \
    /app/env/bin/pip cache purge && \
    apt-get -qq remove gcc g++ pkg-config && \
    apt-get -qq autoremove && \
    apt-get -qq clean && \
    rm -r env_build
ENV PATH="/app/env/bin:$PATH" \
    FFMPEG_BINARY=auto-detect \
    PYTURBO_OPTIONS=no_progress_bar
