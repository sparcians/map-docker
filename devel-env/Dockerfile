FROM map/build-env

MAINTAINER Brett Dutro (brett.dutro@gmail.com)

RUN mkdir -p /tmp/iwyu/build

RUN mkdir -p /opt/iwyu

RUN dnf -y -q install vim emacs neovim gdb valgrind findutils procps nodejs npm zsh util-linux-user ccls file clang-tools-extra llvm-devel llvm-libs clang-devel clang-libs

WORKDIR /tmp/iwyu

RUN git clone https://github.com/include-what-you-use/include-what-you-use.git

WORKDIR /tmp/iwyu/include-what-you-use

RUN git checkout clang_9.0

WORKDIR /tmp/iwyu/build

RUN CC=clang CXX=clang++ cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/opt/iwyu ../include-what-you-use

RUN make -j8

RUN make install

WORKDIR /

RUN rm -rf /tmp/iwyu

RUN ln -s /usr/lib64 /opt/iwyu

RUN useradd -m -u 1000 devuser

RUN mkdir /work; chown -R 1000:1000 /work

RUN chsh -s /usr/bin/zsh devuser

USER 1000:1000

RUN mkdir ~/dotfiles
