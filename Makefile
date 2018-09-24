# Makefile for building Grafana


ORG ?= srflaxu40
REPO ?= grafana
ENVIRONMENT ?= tools

SHA=$(shell git rev-parse --short HEAD)
BRANCH=$(shell git rev-parse --symbolic-full-name --abbrev-ref HEAD)

TAG=${BRANCH}-${SHA}-${ENVIRONMENT}

build:
	docker build \
	-t $(ORG)/$(REPO):${TAG} \
	--no-cache \
	.
	echo "TAG=${TAG}" > tag.properties

push:
	docker push \
	$(ORG)/$(REPO):${TAG}
