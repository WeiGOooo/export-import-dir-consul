#!/bin/sh

CONSUL_PREFIX=""
SERVICE_CONSUL_DIR=""


consul kv export -http-addr=https://consul... ${CONSUL_PREFIX}/${SERVICE_CONSUL_DIR}/${SOURCE_CONSUL_DIR} > dump.json
sed -i "s/$SOURCE_CONSUL_DIR/$TARGET_CONSUL_DIR/g" dump.json
consul kv import -http-addr=https://consul...  @dump.json
rm -f dump.json
