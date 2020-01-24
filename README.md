# MAP Docker Containers

Docker containers used to provide consistent environments to build, run, and develop for MAP.

## Quick Start for Development Environment

If Docker isn't already installed, follow [these instructions](https://docs.docker.com/install/) to install it.

To use Docker under WSL, look [here](https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly).

To use a pre-built image:

    docker load --input <path to downloaded devel-env image>
    docker run -it --name <container name> map/devel-env

To build the images from scratch:

    make
    docker run -it --name <container name> -m 4g map/devel-env

If you want to map a local directory to the container, use the following run command instead:

    docker run -it -v <path to local dir>:/work --name <container name> -m 4g map/devel-env

If you're running Windows, mapping a local directory may be problematic. The easiest way to work around this is with a Docker volume:

    docker volume create work
    docker run -it -v work:/work --name <container name> -m 4g map/devel-env

## Restarting an Existing Container

    docker start -i <container name>

## What's Included

There are 3 Dockerfiles included in this repo: run-env, build-env, and devel-env.

* **run-env**: Contains the minimum number of packages to run precompiled MAP executables. This should be kept as minimal and lean as possible since it will be used to run studies on the cloud.
* **build-env**: Contains everything from run-env, plus the necessary packages to build MAP executables. This image could be used as part of a build farm on the cloud.
* **devel-env**: Contains everything from run-env and build-env, plus editors, debuggers, and other tools needed to develop MAP software. This provides a consistent development environment that will always be compatible with the run and build environments.
* **trace-env**: Contains everything from devel-env, plus libraries and tools needed to build and trace RISC-V workloads
* **rtl-env**: Contains everything from devel-env, plus verilator
