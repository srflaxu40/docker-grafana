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

rotate:
	confd \
	-onetime \
	-backend env \
	-config-file confd_files/conf.d/grafana.toml \
	-confdir ./confd_files/

push:
	docker push \
	$(ORG)/$(REPO):${TAG}
