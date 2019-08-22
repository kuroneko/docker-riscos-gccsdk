all:	build

GCC_REV=$(shell svn info --show-item revision gcc4 | sed -e 's/ //g')
CONTAINER_TAG=r$(GCC_REV)
CONTAINER_NAME=akuneko/riscos-gccsdk
NUMPROC?=4

export NUMPROC

build:	gcc4
	docker build -t ${CONTAINER_NAME}:${CONTAINER_TAG} -t ${CONTAINER_NAME}:latest --build-arg NUMPROC=${NUMPROC} --build-arg MAKEFLAGS="-j${NUMPROC}" .

gcc4:
	svn co svn://svn.riscos.info/gccsdk/trunk/gcc4 gcc4

.PHONY:	update-all
update-all:	gcc4
	cd gcc4 && svn up

push:	build
	docker push ${CONTAINER_NAME}:${CONTAINER_TAG} 
	docker push ${CONTAINER_NAME}:latest
