FROM fluent/fluent-bit:0.11.9
MAINTAINER Eduardo Silva <eduardo@treasure-data.com>
USER root

RUN apt-get update
RUN apt-get install -y --no-install-recommends make
RUN apt-get install -y --no-install-recommends git
RUN apt-get install -y --no-install-recommends build-essential
RUN apt-get install -y --no-install-recommends curl

#RUN apt-get install -y --no-install-recommends golang
RUN curl https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz | tar -C /usr/local -xzf -
ENV PATH "$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/go/bin"

ENV GOPATH=/gocode

# during development this is a local clone of https://github.com/Yolean/fluent-bit-kafka-output-plugin
COPY fluent-bit-kafka-output-plugin /gocode/src/fluent-bit-kafka-output-plugin

RUN cd /gocode/src/fluent-bit-kafka-output-plugin \
  && go get .

RUN cd /gocode/src/fluent-bit-kafka-output-plugin \
  && make \
  && shasum /gocode/src/fluent-bit-kafka-output-plugin/*.so \
  && shasum /gocode/bin/*

COPY fluent-bit.conf /fluent-bit/etc/
COPY parsers.conf /fluent-bit/etc/

#CMD ["/fluent-bit/bin/fluent-bit", "-e", "/gocode/bin/fluent-bit-kafka-output-plugin", "-c", "/fluent-bit/etc/fluent-bit.conf"]
CMD ["/fluent-bit/bin/fluent-bit", "-e", "/gocode/src/fluent-bit-kafka-output-plugin/out_kafka.so", "-c", "/fluent-bit/etc/fluent-bit.conf"]
