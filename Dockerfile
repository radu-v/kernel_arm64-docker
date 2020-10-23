FROM ubuntu

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
    xz-utils \
    zip \
    ccache \
 && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/kdrag0n/proton-clang.git /toolchain --depth=1

ENV KBUILD_BUILD_USER "circleci"
ENV KBUILD_BUILD_HOST github.com
ENV PATH /toolchain/bin:$PATH
ENV LD_LIBRARY_PATH /toolchain/lib:$LD_LIBRARY_PATH
ENV ARCH arm64
ENV SUBARCH arm64
ENV AR llvm-ar
ENV NM llvm-nm
ENV OBJCOPY llvm-objcopy
ENV OBJDUMP llvm-objdump
ENV STRIP llvm-strip
