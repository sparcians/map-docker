FROM map/devel-env

MAINTAINER Brett Dutro (brett.dutro@gmail.com)

USER root

RUN dnf -y -q install qemu-system-riscv.x86_64 dtc autoconf automake libmpc-devel mpfr-devel gmp-devel gawk bison flex texinfo patchutils zlib-devel expat-devel

USER 1000:1000
