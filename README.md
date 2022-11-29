# rport-pairing image
[![Docker](https://github.com/pocki/rport-pairing-image/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/pocki/rport-pairing-image/actions/workflows/docker-publish.yml)

Docker image for the [rport-pairing service](https://github.com/cloudradar-monitoring/rport-pairing) of excellent [rport.io](https://github.com/cloudradar-monitoring/rport) remote systems manager. 

## Multi-arch

Currently builds images for

 - linux/amd64
 - linux/arm64

## Configuration

Configuration can be provided by mounting a `/etc/rport/rport-pairing.conf` file.
See `rport-pairing.conf.template`

