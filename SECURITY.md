# Security policy

## Supported artifact

Security fixes and artifact updates apply to the latest revision of `main`. Always verify the published SHA-256 checksum before first use and after replacing the binary.

## Report a vulnerability

Email **anubis.chain@proton.me** with:

- `geth` in the subject
- the affected binary, flag, RPC method, or network behavior
- impact and reproduction steps
- any suggested mitigation

Do not open a public issue or publish exploit details before the maintainers have had an opportunity to investigate and coordinate a fix. Never send private keys, seed phrases, keystore files, validator keys, authentication tokens, or production credentials.

## Binary verification

```bash
sha256sum --check checksums/SHA256SUMS
```

Do not run an artifact whose checksum differs from the published value.

## RPC exposure

The README command binds HTTP and WebSocket RPC to `127.0.0.1`. Do not change either listener to a public address while using wildcard virtual-host or origin settings.

Only the `eth`, `net`, and `web3` namespaces are enabled in the example. Do not expose administrative, account-management, personal, or debug namespaces publicly.

## Node host

- Run the process as a dedicated unprivileged user.
- Keep the data directory and keystore inaccessible to other users.
- Apply operating-system security updates.
- Back up keys separately; this repository contains no keys or node data.
- Monitor disk space, peer count, synchronization status, and RPC access.
