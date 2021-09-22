#!/usr/bin/env bash

# Directly use as wirealert.sh <param/s>
# Use xargs to pipe the data, echo 1 2 3 4 5 | xargs -I {} wireshark.sh {}
[ ! -z "$WIRE_ALERT" -a "$#" -gt 0 ] && curl -H "Content-Type: application/json" \
                                             -X POST -d \
                                             '{"content":"'"$*"'"}' \
                                             "${WIRE_ALERT}"
