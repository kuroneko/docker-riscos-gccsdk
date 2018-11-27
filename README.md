# riscos-gccsdk 

GCC for RISC OS Crosscompiler

## Container Layout

 * `/opt/gccsdk/bin` contains the compiler binaries.

## Building the Container

Run `make build`.

If everything is OK, the container name should be printed at the end.

As the build-world script only ever runs default (one process) builds, the
build is quite slow, even on a fast system.

If you want to upload a variant of the image, change or override 
`CONTAINER_NAME` to reference your desired registry/repository.

