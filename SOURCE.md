# Source provenance

This repository distributes a prebuilt binary and is not the client source tree.

The binary's embedded Go build information reports:

```text
Command:  github.com/ethereum/go-ethereum/cmd/geth
Module:   github.com/ethereum/go-ethereum
Version:  v1.0.2-0.20261117113209-10f78136bfec
Revision: 10f78136bfec4a7992970734fac9470a7ccd3c74
Time:     2026-11-17T11:32:09Z
Modified: false
Go:       go1.26.1
Target:   linux/amd64
```

The revision and clean-tree flag come from metadata embedded by the Go toolchain. A deterministic rebuild comparison has not been performed, so the checksum proves artifact identity but not reproducibility from source.

This candidate was supplied as `geth20261120`. That filename is not an independently verified build timestamp. The corresponding source diff and network/function validation remain pending. The embedded source revision is not a commit in this binary-distribution repository.

To request the corresponding Anubis Chain source for this published binary, email **anubis.chain@proton.me** with the full source revision above.
