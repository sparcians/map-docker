FROM bdutrosv/map-devel:latest

MAINTAINER Brett Dutro (brett.dutro@gmail.com)

USER root

RUN dnf -y -q install dtc autoconf automake libmpc-devel mpfr-devel gmp-devel gawk bison flex texinfo patchutils zlib-devel expat-devel && \
    dnf -y -q clean all && \
    mkdir /toolchain && \
    cd /toolchain && \
    git clone https://github.com/riscv/riscv-gnu-toolchain.git && \
    cd /toolchain/riscv-gnu-toolchain && \
    git submodule update --init --recursive && \
    mkdir build && \
    cd /toolchain/riscv-gnu-toolchain/build && \
    ../configure --prefix=/opt/riscv --with-cmodel=medany && \
    make -j8 && \
    make install && \
    ../configure --prefix=/opt/riscv --enable-multilib --with-cmodel=medany && \
    make -j8 linux && \
    make install && \
    cp ../riscv-binutils/include/ansidecl.h ../riscv-binutils/include/bfdlink.h ../riscv-binutils/include/diagnostics.h ../riscv-binutils/include/dis-asm.h ../riscv-binutils/include/plugin-api.h ../riscv-binutils/include/symcat.h ../riscv-binutils/opcodes/disassemble.h build-binutils-linux/bfd/bfd.h build-binutils-linux/bfd/bfd_stdint.h /opt/riscv/include && \
    cd /toolchain/riscv-gnu-toolchain/build/build-binutils-linux/intl && \
    make libintl.a && \
    cd /toolchain/riscv-gnu-toolchain/build && \
    cp build-binutils-linux/opcodes/libopcodes.a build-binutils-linux/bfd/libbfd.a build-binutils-linux/libiberty/libiberty.a build-binutils-linux/intl/libintl.a /opt/riscv/lib64 && \
    cd / && \
    rm -rf /toolchain

USER 1000:1000
