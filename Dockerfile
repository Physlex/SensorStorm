FROM nvcr.io/nvidia/l4t-base:r32.4.3

WORKDIR /jetsonNano/sensorStorm/

# Prepare the environment for compilation
RUN apt-get update && \
    apt-get install -y gcc g++ cmake

COPY . /jetsonNano/sensorStorm/

# Actually run the build
RUN mkdir build && cd build && cmake .. && make

CMD ["./build/bin/SensorStorm"]
