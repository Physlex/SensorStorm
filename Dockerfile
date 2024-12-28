FROM nvcr.io/nvidia/l4t-base:r32.4.3

WORKDIR /jetsonNano/sensorStorm/
COPY . .

RUN cmake

## Gonna need to find a way to install the cmake dependencies
