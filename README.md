# Anubis Chain Geth

Prebuilt Anubis Chain Geth client for running a mainnet full node.

## Release Information

| Item | Value |
|---|---|
| Platform | Linux x86-64 (`amd64`) |
| Binary | `bin/geth` |
| Go version | `go1.26.1` |
| Source module | `github.com/ethereum/go-ethereum` |
| Source revision | `1ee6f5ddd9d7d5d61e97f19cc33e0b098556d0ed` |
| Build time revision date | 2026-05-20 |
| SHA-256 | `7e3f22af504964c00db367d728328aac34b0c880091019fe19861e8cbfaa93de` |

The embedded Go build metadata reports a clean source tree at the stated
revision. See [SOURCE.md](SOURCE.md) for provenance details.

## Requirements

- A 64-bit x86 Linux server
- Sufficient disk space for a full mainnet node
- Reliable network connectivity
- Permission to create the default Geth data directory

This binary does not run natively on macOS or ARM64 Linux.

## Verify the Binary

Verify the checksum before the first run:

```bash
sha256sum --check checksums/SHA256SUMS
```

Expected output:

```text
bin/geth: OK
```

## Mainnet Startup Command

The repository root contains a `geth` symlink, so the original command can be
used directly:

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

Alternatively, run the included startup script:

```bash
./scripts/start-mainnet.sh
```

Any extra arguments are appended to the command:

```bash
./scripts/start-mainnet.sh --datadir /var/lib/anubis
```

## RPC Endpoints

The startup command exposes local-only RPC endpoints:

- HTTP: `http://127.0.0.1:8545`
- WebSocket: `ws://127.0.0.1:8546`
- Enabled namespaces: `eth`, `net`, `web3`

Test the HTTP endpoint:

```bash
curl -sS \
  -H "Content-Type: application/json" \
  --data '{"jsonrpc":"2.0","method":"eth_chainId","params":[],"id":1}' \
  http://127.0.0.1:8545
```

## Security

The configured HTTP and WebSocket listeners bind to `127.0.0.1`. Keep them
local-only. The wildcard virtual-host and WebSocket-origin settings must not be
combined with a public bind address unless an authenticated reverse proxy and
network access controls are in place.

Review [SECURITY.md](SECURITY.md) before production deployment.

## License

The client is distributed under the license terms included in [COPYING](COPYING)
and [COPYING.LESSER](COPYING.LESSER). Corresponding source is identified in
[SOURCE.md](SOURCE.md).
