FROM ubuntu:20.04

# COPY scripts/install_dependencies.sh install_dependencies.sh

# RUN sh -c ./install_dependencies.sh

# Install dependencies
RUN \
    --mount=type=cache,target=/var/cache/apt \
    apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    build-essential \
    libeigen3-dev \
    cmake

COPY . .

# Install G2O
RUN mkdir build && cd build && cmake .. && make && cd ..