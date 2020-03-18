FROM bdutrosv/map-build:latest

MAINTAINER Brett Dutro (brett.dutro@gmail.com)

RUN dnf -y -q install vim emacs neovim gdb valgrind findutils procps nodejs npm zsh util-linux-user ccls file clang-tools-extra llvm-devel llvm-libs clang-devel clang-libs wget && \
    dnf -y -q clean all && \
    mkdir -p /tmp/iwyu/build && \
    mkdir -p /opt/iwyu && \
    cd /tmp/iwyu && \
    git clone https://github.com/include-what-you-use/include-what-you-use.git && \
    cd /tmp/iwyu/include-what-you-use && \
    git checkout clang_9.0 && \
    cd /tmp/iwyu/build && \
    CC=clang CXX=clang++ cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/opt/iwyu ../include-what-you-use && \
    make -j8 && \
    make install && \
    cd / && \
    rm -rf /tmp/iwyu && \
    ln -s /usr/lib64 /opt/iwyu && \
    useradd -m -u 1000 devuser && \
    mkdir /work && \
    chown -R 1000:1000 /work && \
    chsh -s /usr/bin/zsh devuser && \
    mkdir /home/devuser/dotfiles && \
    chown -R 1000:1000 /home/devuser/dotfiles

USER 1000:1000
