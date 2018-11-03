FROM ubuntu:latest as builder

WORKDIR /usr/src/gccsdk

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y libtool patch wget help2man autogen m4 gcc g++ bison flex subversion gperf sed make build-essential autoconf2.13 automake cvs doxygen dpkg-dev gettext intltool libglib2.0-dev liborbit2-dev libpopt-dev pkg-config policykit-1 rman subversion unzip wget xsltproc texinfo git libx11-dev tcl subversion

COPY ./gcc4 gcc4

COPY ./gccsdk-params gcc4

RUN cd gcc4 && ./build-world

FROM ubuntu:latest

ENV PATH=/opt/gccsdk/bin:${PATH}

WORKDIR /usr/src/gccsdk/build

COPY --from=builder /opt/gccsdk /opt/gccsdk

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y subversion autogen m4 texinfo build-essential bison flex gperf sed libtool patch wget help2man cvs autoconf automake rman

COPY ./autobuilder /usr/src/gccsdk/autobuilder

CMD /bin/bash 
