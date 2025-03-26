all: intune-portal

.packaging:
	mkdir -p ./packaging/

DOCKER := $(shell command -v podman || command -v docker)

intune-portal: .packaging
	$(DOCKER) build -f ./Dockerfile.intune-portal-appimage -t intune-portal-appimage-builder .
	$(DOCKER) run --rm --privileged -v ./packaging/:/output intune-portal-appimage-builder
