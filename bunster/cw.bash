#!/bin/bash

#set -euo pipefail

if [[ "-$1" == "-" ]]; then
    echo "Usage: cw PREFIX"
    exit
fi

grep "^$1" /usr/share/dict/words | wc -l
