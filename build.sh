#!/bin/bash

cd /usr/local/src

if [[ ! -d /usr/local/src/ipxe/src/ ]]; then
  git clone git://git.ipxe.org/ipxe.git
fi

cd ipxe/src/
make
