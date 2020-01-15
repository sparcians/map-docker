FROM map/build-env

MAINTAINER Brett Dutro (brett.dutro@gmail.com)

RUN dnf -y -q install vim emacs neovim gdb valgrind findutils procps nodejs npm zsh util-linux-user ccls file clang-tools-extra

RUN useradd -m -u 1000 devuser

RUN mkdir /work; chown -R 1000:1000 /work

RUN chsh -s /usr/bin/zsh devuser

USER 1000:1000

RUN mkdir ~/dotfiles
