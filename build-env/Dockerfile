FROM map/run-env

MAINTAINER Brett Dutro (brett.dutro@gmail.com)

RUN dnf -y -q install gcc gcc-c++ clang cmake boost-devel boost-python3-devel yaml-cpp-devel sqlite-devel hdf5-devel python3-devel git rapidjson make xz
# Install cppcheck 1.89
RUN dnf -y -q install cppcheck --enablerepo=updates-testing
