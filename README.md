# grin-docker
Dockerfile for grin node and grin wallet

- We expose grin-node at port 3413, and wallet-api at 13420
- After initial run
  - Generated `seed_phrase` and first address is at `data/wallet/init.txt`
  - Encrypted wallet is at `data/wallet/wallet.seed`
  - Wallet pass is `word`
- Because wallet-api listening on `127.0.0.1`, you'll have to do port-forwarding if access from outside
  - `iptables -t nat -I PREROUTING -p tcp -d <external_ip> --dport 13420 -j DNAT --to-destination 127.0.0.1:13420`
  - `sysctl -w net.ipv4.conf.<iface>.route_localnet=1`

## Build

```
docker build -t grin .
```

## Run

```
mkdir data
docker run --rm -itd --name igrin --network host -v `pwd`/data:/opt/coin grin
```

## Using pre-built docker image

Using automated build image from <https://hub.docker.com/r/mixhq/grin/>:

```
docker run --rm -itd --name igrin --network host -v `pwd`/data:/opt/coin mixhq/grin
```
