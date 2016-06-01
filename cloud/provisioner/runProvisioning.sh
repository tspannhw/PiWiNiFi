#!/bin/sh

realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

NIFI_HOME=/opt/nifi
docker run -it \
  -p 443:443 \
  -v $(realpath ./data):/data \
  -v $(realpath ./certs):/etc/nginx/certs/:ro \
  simonellistonball/provisioner
