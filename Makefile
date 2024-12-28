# This Makefile is explicitly used to simplify working with docker builds
# (Some of these commands are so friggin long...)

# PROJECT SPECIFICATIONS

PROJECT_NAME:=sensorstorm-image
DOCKER:=docker
BUILDER:=buildx
WORKSPACE:=.


# COMMANDS AND CONFIG

BUILD:=build
RUN:=run


# MULTIPLATFORM SETUP

XPLATFORM:=--platform linux/arm64,linux/amd64
XPLATFORM_TAG:=-t multiplatform


buildx:
	${DOCKER} ${BUILDER} create --use

docker-build-multiplatform:
	${DOCKER} ${BUILDER} ${BUILD} ${XPLATFORM} ${XPLATFORM_TAG} ${WORKSPACE}


# EMULATED HOST SETUP

HOST_TAG:=-t sensorstorm-host-image
QEMU_SETUP:=--rm --privileged multiarch/qemu-user-static --reset -p yes


enable-qemu:
	${DOCKER} ${RUN} ${QEMU_SETUP} > /dev/null 2>&1

docker-build-host:
	${DOCKER} ${BUILD} ${HOST_TAG} ${WORKSPACE}

docker-run-host: enable-qemu
	${DOCKER} ${RUN} --rm --platform linux/arm64 ${HOST_TAG}
