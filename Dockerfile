FROM centos:7

ARG KUDU_VERSION=1.4.0
ARG PARALLEL=8

ENV KUDU=apache-kudu-${KUDU_VERSION}
ENV KUDU_URL="http://www.apache.org/closer.cgi?filename=kudu/${KUDU_VERSION}/${KUDU}.tar.gz&action=download"

ADD . /repo 

RUN yum install -y autoconf automake cyrus-sasl-devel cyrus-sasl-gssapi \
  cyrus-sasl-plain gcc gcc-c++ gdb git krb5-server krb5-workstation libtool \
  make openssl-devel patch pkgconfig redhat-lsb-core rsync unzip vim-common which wget


RUN echo "Downloading $KUDU_URL" \
  && wget -q $KUDU_URL -O /tmp/${KUDU}.tar.gz \
  && cd /tmp \
  && tar xf ${KUDU}.tar.gz \
  && /repo/build \
  && rm -r /tmp/*

COPY ./entrypoint /

WORKDIR /app

ENTRYPOINT ["/entrypoint"]
