#!/bin/ash

[[ $# -lt 3 ]] && echo "Usage: $0 DOMAIN USERNAME API_TOKEN RECORD_ID" && exit 1

DOMAIN=${1}
USERNAME=${2}
API_TOKEN=${3}
RECORD_ID=${4}

ENDPOINT="https://api.name.com/v4/domains/$DOMAIN/records/$RECORD_ID"

IP=$(curl "https://api.ipify.org" -ks)

DATA="{\"host\":\"home\",\"type\":\"A\",\"answer\":\"$IP\",\"ttl\":300}"

RESPONSE=$(curl -u "$USERNAME:$API_TOKEN" "$ENDPOINT" -X PUT --data "$DATA")

echo "$0: updated $DOMAIN, response: $RESPONSE" | logger
