#!/usr/bin/env bash

set -e

mkdir -p /opt/coin/{data,wallet}

if test $# -eq 0; then
  # generate wallet seed if needed
  [ ! -f /opt/coin/wallet/wallet.seed ] && {
    echo "Generated wallet at /opt/coin/wallet/init.txt with password 'word'..."
    echo -e 'word\nword\n' | /opt/grin wallet init > /opt/coin/wallet/init.txt
  }
  # start node
  /opt/grin server run &
  # wallet api
  exec /opt/grin wallet --pass word owner_api
else
  exec $@
fi
