all:	build

GCC_REV=$(svn info --show-item revision gcc4)
AUTOBUILDER_REV=$(svn info --show-item revision autobuilder)
CONTAINER_TAG=gcc$(GCC_REV)-ab$(AUTOBUILDER_REV)
CONTAINER_NAME=akuneko/riscos-gccsdk

build:	update-all
	docker build -t ${CONTAINER_NAME}:${CONTAINER_TAG} -t ${CONTAINER_NAME}:latest .

gcc4:
	svn co svn://svn.riscos.info/gccsdk/trunk/gcc4 gcc4

autobuilder:
	svn co svn://svn.riscos.info/gccsdk/trunk/autobuilder autobuilder


.PHONY:	update-all

update-all:	autobuilder gcc4
	cd autobuilder && svn up
	cd gcc4 && svn up

