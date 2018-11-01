all:	build

CONTAINER_TAG:=$(shell date -u '+%Y%m%d%H%M')
CONTAINER_NAME=akuneko/riscos-gccsdk

build:
	docker build -t ${CONTAINER_NAME}:${CONTAINER_TAG}

