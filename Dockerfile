FROM alpine:3 AS builder

ENV CASSANDRA_VERSION 4.0.3

RUN apk --no-cache update \
 && apk --no-cache upgrade \
 && apk --no-cache add curl gnupg jq \
 && mkdir -p /opt

WORKDIR /opt

RUN curl -sSLO https://downloads.apache.org/cassandra/KEYS \
 && gpg --import KEYS \
 && mirror=$(curl --stderr /dev/null https://www.apache.org/dyn/closer.cgi\?as_json\=1 | jq -r '.preferred') \
 && curl -sSLO "${mirror}cassandra/${CASSANDRA_VERSION}/apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz" \
 && curl -sSLO "${mirror}cassandra/${CASSANDRA_VERSION}/apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz.asc" \
 && gpg --verify "apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz.asc" "apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz"

RUN tar xzvf "apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz" \
 && mv "apache-cassandra-${CASSANDRA_VERSION}" cassandra


FROM alpine:3

RUN apk --no-cache update \
 && apk --no-cache upgrade \
 && apk --no-cache add bash ca-certificates openjdk8-jre python3 su-exec

COPY --from=builder /opt/cassandra /opt/cassandra

RUN adduser -D -s /bin/bash -Hh /opt/cassandra cassandra \
 && chown -R cassandra:cassandra /opt/cassandra

WORKDIR /opt/cassandra

ENV PATH /opt/cassandra/bin:$PATH

COPY conf/cassandra.yaml /opt/cassandra/conf/
COPY entrypoint /entrypoint

ENTRYPOINT ["/entrypoint"]
