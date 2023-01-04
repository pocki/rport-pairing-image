FROM alpine:3.17 as downloader

ARG RPORT_PAIRING_VERSION=2301.3.1146
RUN apk add unzip

WORKDIR /app/

RUN set -e \
    && wget https://github.com/cloudradar-monitoring/rport-pairing/releases/download/${RPORT_PAIRING_VERSION}/rport-pairing_Linux_$(uname -m).tar.gz -O rport-pairing.tar.gz \
    && tar xzf rport-pairing.tar.gz rport-pairing

FROM debian:11

COPY --from=downloader /app/rport-pairing /usr/local/bin/rport-pairing
COPY entrypoint.sh /entrypoint.sh

ARG UID=1234
ARG GID=1234

RUN groupadd -g "${GID}" rport \
  && useradd --create-home --no-log-init -u "${UID}" -g "${GID}" rport

USER rport
COPY --chown=rport:rport rport-pairing.conf.template /etc/rport/rport-pairing.conf.template

LABEL maintainer="Christoph Pock <dev+github@pocki.xyz>" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.vcs-ref="github.com/pocki/rport-pairing-image" \
    org.label-schema.name="rport-pairing" \
    org.label-schema.description="RPort Pairing Service" \
    org.label-schema.url="https://github.com/pocki/rport-pairing-image" \
    org.label-schema.vcs-url="https://github.com/pocki/rport-pairing-image"

EXPOSE 8080

ENTRYPOINT [ "/bin/bash", "/entrypoint.sh", "/usr/local/bin/rport-pairing", "-c", "rport-pairing.conf" ]
