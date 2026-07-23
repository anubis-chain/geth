#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "${SCRIPT_DIR}/.." && pwd)"
GETH_BIN="${GETH_BIN:-${REPO_ROOT}/bin/geth}"

if [[ ! -x "${GETH_BIN}" ]]; then
  echo "Error: executable not found at ${GETH_BIN}" >&2
  exit 1
fi

exec "${GETH_BIN}" \
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
  --syncmode full \
  "$@"
