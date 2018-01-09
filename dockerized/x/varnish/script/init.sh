#!/bin/sh

set -e

varnishd -a "0.0.0.0:$VARNISH_PORT" -F -f /etc/varnish/default.vcl -s malloc,$VARNISH_CACHE_SIZE

