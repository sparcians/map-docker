FROM map/devel-env

MAINTAINER Brett Dutro (brett.dutro@gmail.com)

USER root

RUN dnf -y -q install dtc autoconf automake libmpc-devel mpfr-devel gmp-devel gawk bison flex texinfo patchutils zlib-devel expat-devel

RUN mkdir /toolchain

WORKDIR /toolchain

RUN git clone https://github.com/riscv/riscv-gnu-toolchain.git

WORKDIR /toolchain/riscv-gnu-toolchain

RUN git submodule update --init --recursive

RUN mkdir build

WORKDIR /toolchain/riscv-gnu-toolchain/build

RUN ../configure --prefix=/opt/riscv --with-cmodel=medany

RUN make -j8

RUN make install

RUN ../configure --prefix=/opt/riscv --enable-multilib --with-cmodel=medany

RUN make -j8 linux

RUN make install

RUN cp ../riscv-binutils/include/ansidecl.h ../riscv-binutils/include/bfdlink.h ../riscv-binutils/include/diagnostics.h ../riscv-binutils/include/dis-asm.h ../riscv-binutils/include/plugin-api.h ../riscv-binutils/include/symcat.h /opt/riscv/include

RUN cp ../riscv-binutils/opcodes/disassemble.h /opt/riscv/include

RUN cp build-gdb-newlib/bfd/bfd.h build-gdb-newlib/bfd/bfd_stdint.h /opt/riscv/include

WORKDIR /toolchain/riscv-gnu-toolchain/build/build-gdb-newlib/intl

RUN make libintl.a

WORKDIR /toolchain/riscv-gnu-toolchain/build

RUN cp build-gdb-newlib/opcodes/libopcodes.a build-gdb-newlib/bfd/libbfd.a build-gdb-newlib/libiberty/libiberty.a build-gdb-newlib/intl/libintl.a /opt/riscv/lib64

WORKDIR /

RUN rm -rf /toolchain

RUN dnf -y -q install zstd libzstd libzstd-devel glib2 glib2-devel

RUN dnf -y -q install pixman pixman-devel

RUN dnf -y -q install glibc-static glib2-static pcre-static

RUN dnf -y -q install xz-devel

RUN dnf -y -q install python2-scons swig python2-six

RUN dnf -y -q install protobuf protobuf-compiler protobuf-devel gperftools-libs gperftools-devel gperftools

RUN dnf -y -q install libtool binutils-devel bind-devel

USER 1000:1000
