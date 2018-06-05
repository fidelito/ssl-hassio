#!/bin/bash
set -e

CONFIG_OPTIONS=/data/options.json

COUNTRY=$(US)
STATE=$(FL)
LOCALITY=$(Miami)
ORG=$(OU)
ORG_UNIT=$(OU)
COMMON_NAME=$(CN)
EMAIL=$(me@me.com)
CERTFILE=$(jq --raw-output ".certfile" $CONFIG_OPTIONS)
KEYFILE=$(jq --raw-output ".keyfile" $CONFIG_OPTIONS)

echo `openssl version`

openssl req \
  -sha256 \
  -newkey rsa:4096 \
  -nodes \
  -keyout /ssl/$KEYFILE \
  -x509 \
  -days 730 \
  -out /ssl/$CERTFILE \
  -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORG/OU=$ORG_UNIT/CN=$COMMON_NAME/emailAddress=$EMAIL"
