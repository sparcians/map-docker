FROM map/devel-env

MAINTAINER Brett Dutro (brett.dutro@gmail.com)

USER root

RUN dnf -y -q install verilator jq java-1.8.0-openjdk-headless java-1.8.0-openjdk-devel ruby rubygem-bundler haskell-platform libftdi libftdi-devel chrpath libstdc++-static python3-pyyaml dtc

RUN chown -R devuser:devuser /opt

USER 1000:1000
