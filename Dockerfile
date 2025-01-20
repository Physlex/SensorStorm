FROM nvcr.io/nvidia/l4t-base:r34.1 AS Build

# Set working directory
WORKDIR /jetsonNano/sensorStorm/

# Update the OS
RUN apt-get update -y
RUN apt-get upgrade -y

# Setup mosquitto message broker
RUN apt-get install -y software-properties-common
RUN apt-add-repository ppa:mosquitto-dev/mosquitto-ppa
RUN apt-get install -y mosquitto mosquitto-clients

# Dev-Dependencies
RUN apt-get install -y \
    cmake \
    git \
    curl \
    zip \
    unzip \
    gdb \
    gcc \
    g++ \
    ninja-build \
    make && \
    rm -rf /var/lib/apt/lists/*

# Reset to the runtime directory
WORKDIR /jetsonNano/sensorStorm/

# Prepare the runtime environment with our files
COPY CMakeLists.txt /jetsonNano/sensorStorm/
COPY weather_station/ /jetsonNano/sensorStorm/weather_station/

# Actually run the build
RUN cmake -S . -B build
