#!/bin/bash
set -e

COUNTRY="US"
STATE="FL"
LOCALITY="Miami"
ORG=$(OU)
ORG_UNIT="OU"
COMMON_NAME="CN"
EMAIL="me@me.com"
CERTFILE="certificate.pem"
KEYFILE="privkey.pem"

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
