#!/bin/sh
set -ex

conf_file=/etc/rport/rport-pairing.conf
if [ ! -f "${conf_file}" ]; then
    mkdir -p `dirname $conf_file`
    cp /etc/rport/rport-pairing.conf.template ${conf_file}
    #ep ${conf_file}
fi

exec "$@"
