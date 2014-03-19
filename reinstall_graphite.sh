#!/bin/bash

GDIR="/usr/local/src/graphite"

rm -rf $GDIR
virtualenv $GDIR
chown -R graphite.graphite /usr/local/src/graphite

sudo -u graphite /tmp/install-graphite.sh
