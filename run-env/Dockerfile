FROM fedora:31

MAINTAINER Brett Dutro (brett.dutro@gmail.com)

RUN dnf -y -q update && \
    dnf -y -q install boost yaml-cpp sqlite-libs hdf5 python3 boost-python3 xz zstd libzstd && \
    dnf -y -q clean all
