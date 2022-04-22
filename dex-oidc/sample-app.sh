#!/bin/sh

primary_ip=$(ip route get 8.8.8.8 | head -1 | cut -d' ' -f7)

docker run -it --rm \
    -p 5555:5555 \
    oukooveu/dex-sample-app:2.31.1 \
      --debug \
      --listen http://0.0.0.0:5555 \
      --issuer http://sso.${primary_ip}.nip.io:5556/dex
