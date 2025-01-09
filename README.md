# Sensor Storm

![License](https://img.shields.io/github/license/username/repository)
![Stars](https://img.shields.io/github/stars/username/repository)
![Issues](https://img.shields.io/github/issues/username/repository)


## Overview

This github repository defines the software package for ETL and administration of UASTARR's NVIDIA Jetson Nano project (Avionics).


## Features

#### Sensor Process Management
    Monitor sensor ETL processes as they extract, transform, and load data

- Monitor Dataflow from external peripherals to a JetsonNano Main Board
    - Enable, Disable, Restart, and Kill sensor processes
    - Read and monitor sensor logs


#### Diagonstics Transmission
    Monitor the mainboard status and transmit along CAN to BLE Expansion Card

- SPI -> CAN integration with the Bifrost (TODO: name pending)
- Temperature and Power Monitoring
- Errors and Warnings from processes within the Jetson


#### Camera Integration
    Record a 360deg view of the jetson nano via the arducam modules

- Support for MIPI / CSI-2 feed 360deg video.
- Wifi transmission of video grames on the 2.4GHz band.


... And much more. This project basically stands as the "hub" of all other projects.


## Getting Started

This project relies heavily on both emulation via QEMU and containerization via DOCKER. For a quick introduction to either of those technologies, please see [https://docs.google.com/document/d/1wemsVqKCjdM_Zzt9AddQuQp1n9oAnCHZUxd34U-N9PI/edit?tab=t.0#heading=h.cxk14xgw75wh](The live document) overviewing the main features provided to the developers. As well, this document provides a brief introduction to docker.

For further details on what exactly each technology does invidually, and in far more depth than we would ever cover in our docs, please see [https://docs.docker.com/get-started/](the official docker get started documentation).


### Prerequisites

Running docker, and the associated docker images as containers, obviously requires the pre-requisite docker software. When developing the application, we used [https://docs.docker.com/get-started/get-docker/](docker desktop). This allows a user to monitor applications while they run, using a similar interface to what would be expected from, for example, heroku or AWS logging software.

As well, this project relies on the [https://github.com/multiarch/qemu-user-static](qemu-user-static) library. The Makefile uses this to run the ARM64 container on an AMD64 styled machine. (Note that AMD stands for both intel and AMD processors, so an AMD machine should work with as well).

Obviously, you are hence also required to use a Makefile. That means for the windows users, it is expected they get access to WSL2 (commonly just called WSL) and run this program on that system instead. Moving away from this is possible, though would require changing the CMake build system. In general, just expect C/C++ to be typically developed via Linux.

Because the device makes use of the jetspace operating system, which is a variant of ubuntu, developers can attempt to run this on their native ubuntu machine. However, it is important to note that any code submitted without being run on the docker container, even if it passes the required tests written, will be considered suspect and up to investigation. This project is expected to be long-lived, so developers should focus first on doing their job *well*, and then fast.


### Building and Running

Because the docker system is a *nightmare* of terms, commands, and so on, we abstract all of it away with a simpler Makefile. With the prior requirements out of the way, a user can run the project through the use of the following command:


```sh
$ make docker-run-host
```

This will give output similar to:

```sh
username@PGName:~/<path-to-project>$ make docker-run-host
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes > /dev/null 2>&1
docker run --rm --platform linux/arm64 -t sensorstorm-host-image
<program-output>
```

The first line is the command being written.

The second and third line are the regurgitated nightmare of keywords that is docker with QEMU.

Finally, the fourth line is the programs output. This will change over the course of the project, and may even output nothing.


### Contributing

To contribute to this project you must be affiliated with UASTARR in some fashion, and given write-privaleges via one of the maintainers. Please make sure you read the `Contributing.md` file prior to actually making an issue and attempting to contribute.
