FROM ubuntu:latest

WORKDIR /usr/src/gccsdk

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y libtool patch wget help2man autogen m4 gcc g++ bison flex subversion gperf sed make build-essential autoconf2.13 automake cvs doxygen dpkg-dev gettext intltool libglib2.0-dev liborbit2-dev libpopt-dev pkg-config policykit-1 rman subversion unzip wget xsltproc texinfo git libx11-dev tcl subversion

RUN svn co svn://svn.riscos.info/gccsdk/trunk/autobuilder autobuilder && mkdir build

RUN svn co svn://svn.riscos.info/gccsdk/trunk/gcc4 gcc4

COPY gccsdk-params gcc4

RUN cd gcc4 && ./build-world

ENV PATH=/opt/gccsdk/bin:${PATH}

CMD /bin/bash 
