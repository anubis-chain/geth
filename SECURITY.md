# Security

## Binary Verification

Verify the SHA-256 checksum before deployment:

```bash
sha256sum --check checksums/SHA256SUMS
```

Do not run a binary whose checksum differs from the published value.

## RPC Exposure

The default startup command binds HTTP and WebSocket RPC to `127.0.0.1`.
Do not change either listener to `0.0.0.0` while using wildcard virtual-host or
origin settings unless access is protected by a firewall and an authenticated
reverse proxy.

Only the `eth`, `net`, and `web3` namespaces are enabled. Do not expose
administrative, personal, debug, or account-management namespaces publicly.

## Node Host

- Run the process as a dedicated unprivileged user.
- Keep the node data directory and keystore inaccessible to other users.
- Apply operating-system security updates.
- Back up keys separately; the repository contains no keys or node data.
- Monitor disk space, peer count, synchronization status, and RPC access logs.

## Reporting

Report suspected vulnerabilities privately to the Anubis Chain maintainers.
Do not include private keys, seed phrases, keystore files, or live credentials.
