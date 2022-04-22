#!/bin/bash

docker run -it --rm --net=host \
    -v $(pwd)/dex-config-dev.yaml:/etc/dex/config.yaml \
    -p 5556:5556 \
    dexidp/dex:v2.31.1 dex serve /etc/dex/config.yaml
