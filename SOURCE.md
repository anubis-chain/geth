# Source provenance

This repository distributes a prebuilt binary and is not the client source tree.

The binary's embedded Go build information reports:

```text
Command:  github.com/ethereum/go-ethereum/cmd/geth
Module:   github.com/ethereum/go-ethereum
Version:  v1.0.2-0.20260520061237-1ee6f5ddd9d7
Revision: 1ee6f5ddd9d7d5d61e97f19cc33e0b098556d0ed
Time:     2026-05-20T06:12:37Z
Modified: false
Go:       go1.26.1
Target:   linux/amd64
```

The revision and clean-tree flag come from metadata embedded by the Go toolchain. A deterministic rebuild comparison has not been performed, so the checksum proves artifact identity but not reproducibility from source.

To request the corresponding Anubis Chain source for this published binary, email **anubis.chain@proton.me** with the full source revision above.
