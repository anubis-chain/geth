# Anubis Chain Geth — 2026-11-20 pre-release

[![Verify release artifact](https://github.com/anubis-chain/geth/actions/workflows/verify-binary.yml/badge.svg?branch=release%2Fgeth-20261120)](https://github.com/anubis-chain/geth/actions/workflows/verify-binary.yml)
[![License: GPL-3.0](https://img.shields.io/badge/license-GPL--3.0-blue.svg)](COPYING)

Candidate Anubis Chain execution client for isolated validation on Linux x86-64. Network compatibility and function validation remain pending.

The stable binary remains on [`main`](https://github.com/anubis-chain/geth) and is preserved in [release `geth-1ee6f5ddd9d7`](https://github.com/anubis-chain/geth/releases/tag/geth-1ee6f5ddd9d7). This candidate is published as [`geth-2026.11.20-rc.1`](https://github.com/anubis-chain/geth/releases/tag/geth-2026.11.20-rc.1).

This artifact is an Anubis/BSC-derived client; it is not an unmodified Ethereum Geth binary.

This is a **binary distribution repository**, not the client source tree. Verify the artifact before running it and review [SOURCE.md](SOURCE.md) for build provenance.

## Release artifact

| Item | Value |
| --- | --- |
| File | `geth` |
| Target | Linux `amd64` / x86-64 |
| Format | Dynamically linked 64-bit ELF |
| Go version | `go1.26.1` |
| Embedded module version | `v1.0.2-0.20261117113209-10f78136bfec` |
| Source revision | `10f78136bfec4a7992970734fac9470a7ccd3c74` |
| Build tree | Clean (`vcs.modified=false`) |
| SHA-256 | `30b181ccbebed56af0047b0ae30b6e7ec53e0e4fb2f13fcd5e0d401f7f3370b4` |

The artifact does not run natively on macOS or ARM64 Linux.

## Expected network

These identifiers describe the existing Anubis mainnet. Verify that the candidate connects to the expected network during isolated validation.

| Item | Value |
| --- | --- |
| Chain ID | `6714` (`0x1a3a`) |
| Explorer | [AnubisScan](https://anubisscan.io/) |
| Public RPC | `https://rpc.anubispace.org` |

The public RPC is useful for comparison and light queries. Run your own node for production workloads that require independent verification or sustained RPC capacity.

## Download

```bash
git clone --depth 1 --branch geth-2026.11.20-rc.1 https://github.com/anubis-chain/geth.git
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

## Isolated node validation

Use a separate data directory and disposable test environment when validating this candidate. Do not point it at an existing production node's database. The following command is a starting point for a separate validation node; successful `geth version` output alone does not establish synchronization, consensus, DAI gas, RPC, or database compatibility.

```bash
./geth \
  --datadir ./geth-candidate-data \
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
