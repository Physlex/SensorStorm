FROM nvcr.io/nvidia/l4t-base:r34.1

WORKDIR /jetsonNano/sensorStorm/

# Prepare the environment for compilation
RUN apt-get update && \
    apt-get install -y \
    gcc   \
    g++   \
    cmake

RUN cat /etc/os-release

COPY . /jetsonNano/sensorStorm/

# Actually run the build
RUN cmake -S . -B build
