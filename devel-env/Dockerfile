FROM map/build-env

MAINTAINER Brett Dutro (brett.dutro@gmail.com)

RUN dnf -y -q install vim emacs neovim gdb valgrind findutils

RUN useradd -m -u 1000 devuser

RUN mkdir /work; chown -R 1000:1000 /work

USER 1000:1000
