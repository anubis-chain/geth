# Anubis Chain Geth

[![Verify release artifact](https://github.com/anubis-chain/geth/actions/workflows/verify-binary.yml/badge.svg)](https://github.com/anubis-chain/geth/actions/workflows/verify-binary.yml)
[![License: GPL-3.0](https://img.shields.io/badge/license-GPL--3.0-blue.svg)](COPYING)

Prebuilt Anubis Chain execution client for Linux x86-64.

`main` contains the updated binary supplied on 2026-11-20, with embedded source revision `10f78136bfec`. Artifact and version checks have passed; node synchronization and function validation remain pending.

This artifact is an Anubis/BSC-derived client; it is not an unmodified Ethereum Geth binary.

This is a **binary distribution repository**, not the client source tree. Verify the artifact before running it and review [SOURCE.md](SOURCE.md) for build provenance.

## Downloads

| Channel | Release | Source revision |
| --- | --- | --- |
| Current binary, same as `main` (pre-release) | [`geth-2026.11.20-rc.1`](https://github.com/anubis-chain/geth/releases/tag/geth-2026.11.20-rc.1) | `10f78136bfec` |
| Previous stable binary | [`geth-1ee6f5ddd9d7`](https://github.com/anubis-chain/geth/releases/tag/geth-1ee6f5ddd9d7) | `1ee6f5ddd9d7` |

Each release includes the Linux x86-64 `geth` binary, `SHA256SUMS`, `VERSION`, source-provenance notes, and embedded Go build metadata. Download `geth` and `SHA256SUMS` into the same directory and run `sha256sum --check SHA256SUMS` before use.

Cloning this repository downloads the current binary. See the pre-release notes for confirmed dependency differences and validation status. The previous stable binary remains available from its release.

## Release artifact

| Item | Value |
| --- | --- |
| File | `geth` |
| Target | Linux `amd64` / x86-64 |
| Format | Dynamically linked 64-bit ELF |
| Go version | `go1.26.1` |
| Embedded module version | `v1.0.2-0.20261117113209-10f78136bfec` |
| Source revision | `10f78136bfec4a7992970734fac9470a7ccd3c74` |
| Source commit time (embedded) | `2026-11-17T11:32:09Z` |
| Build tree | Clean (`vcs.modified=false`) |
| SHA-256 | `30b181ccbebed56af0047b0ae30b6e7ec53e0e4fb2f13fcd5e0d401f7f3370b4` |

The artifact does not run natively on macOS or ARM64 Linux.

## Network

| Item | Value |
| --- | --- |
| Chain ID | `6714` (`0x1a3a`) |
| Explorer | [AnubisScan](https://anubisscan.io/) |
| Public RPC | `https://rpc.anubispace.org` |

The public RPC is useful for comparison and light queries. Run your own node for production workloads that require independent verification or sustained RPC capacity.

## Download

```bash
git clone --depth 1 https://github.com/anubis-chain/geth.git
cd geth
chmod +x geth
```

## Verify before running

```bash
sha256sum --check checksums/SHA256SUMS
file geth
```

Expected checksum result:

```text
geth: OK
```

Do not run the binary if the checksum differs.

## Start a mainnet full node

For validation, use a separate data directory as below. Preserve a compatible backup before upgrading an existing node, and validate synchronization, RPC and DAI gas behavior before production use.

```bash
./geth \
  --datadir ./geth-data \
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

Local RPC endpoints:

- HTTP: `http://127.0.0.1:8545`
- WebSocket: `ws://127.0.0.1:8546`

The wildcard host and origin settings above are acceptable only while both listeners remain bound to loopback (`127.0.0.1`). Never combine them with a public bind address.

The `12 gwei` gas-price value was checked against the public RPC on 2026-09-17. Re-check current network conditions before operating a validator or transaction-sending service.

## Confirm the network

After startup, check the local node's chain ID:

```bash
curl -sS \
  -H "Content-Type: application/json" \
  --data '{"jsonrpc":"2.0","method":"eth_chainId","params":[],"id":1}' \
  http://127.0.0.1:8545
```

Expected result: `0x1a3a`.

Check synchronization status:

```bash
curl -sS \
  -H "Content-Type: application/json" \
  --data '{"jsonrpc":"2.0","method":"eth_syncing","params":[],"id":1}' \
  http://127.0.0.1:8545
```

## Security

- Keep HTTP and WebSocket RPC bound to `127.0.0.1` unless you have explicit firewall, authentication, TLS, and reverse-proxy controls.
- Do not expose administrative, account-management, personal, or debug namespaces publicly.
- Run the process as a dedicated unprivileged operating-system user.
- Protect the data directory, keystore, validator credentials, and backups.

See [SECURITY.md](SECURITY.md) for vulnerability reporting and operational guidance.

## Source and license

Build metadata and source-request information are recorded in [SOURCE.md](SOURCE.md) and [VERSION](VERSION). The client is distributed under the terms in [COPYING](COPYING) and [COPYING.LESSER](COPYING.LESSER).
