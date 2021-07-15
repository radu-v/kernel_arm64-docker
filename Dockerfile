FROM ubuntu:21.10
CMD ["bash"]

RUN apt-get update && apt-get install -y --no-install-recommends \
    bc \
    bison \
    ca-certificates \
    curl \
    flex \
    gcc \
    git \
    make \
    libssl-dev \
    libc6-dev \
    libncurses-dev \
    libxml2 \
    xz-utils \
    zip \
    ccache \
 && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/mvaisakh/gcc-arm64 ${HOME}/gcc-arm64 --depth=1
RUN git clone https://github.com/mvaisakh/gcc-arm ${HOME}/gcc-arm --depth=1

ENV KBUILD_BUILD_USER "blblbl"
ENV KBUILD_BUILD_HOST github.com
ENV PATH ${HOME}/gcc-arm64/bin:${HOME}/gcc-arm/bin:$PATH
