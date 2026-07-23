# Anubis Chain Geth

Prebuilt Anubis Chain mainnet client for Linux x86-64.

## Download

```bash
git clone https://github.com/anubis-chain/geth.git
cd geth
chmod +x geth
```

This binary only supports Linux x86-64. It does not run natively on macOS or
ARM64 Linux.

## Verify

```bash
sha256sum geth
```

Expected SHA-256:

```text
7e3f22af504964c00db367d728328aac34b0c880091019fe19861e8cbfaa93de
```

## Mainnet Startup Command

```bash
./geth \
  --mainnet \
  --miner.gasprice 12000000000 \
  --http \
  --http.addr 127.0.0.1 \
  --http.vhosts "*" \
  --http.api eth,net,web3 \
  --ws \
  --ws.addr 127.0.0.1 \
  --ws.origins "*" \
  --ws.api eth,net,web3 \
  --syncmode full
```

HTTP RPC: `http://127.0.0.1:8545`

WebSocket RPC: `ws://127.0.0.1:8546`

Keep both RPC endpoints bound to `127.0.0.1`. Do not expose wildcard host or
origin settings directly to the public internet.

## Source

- Source: <https://github.com/anubis-chain/anubis>
- Revision: `1ee6f5ddd9d7d5d61e97f19cc33e0b098556d0ed`
- License: GPL-3.0 / LGPL-3.0 as applicable to the source
