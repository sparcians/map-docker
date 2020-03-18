FROM bdutrosv/map-run:latest

MAINTAINER Brett Dutro (brett.dutro@gmail.com)

RUN dnf -y -q install gcc gcc-c++ clang cmake boost-devel boost-python3-devel yaml-cpp-devel sqlite-devel hdf5-devel python3-devel git rapidjson make doxygen texlive-epstopdf ghostscript libzstd-devel xz-devel && \
    dnf -y -q install cppcheck --enablerepo=updates-testing && \
    dnf -y -q clean all
