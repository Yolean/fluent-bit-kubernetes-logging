#!/usr/bin/env bash
[ -z "$DEBUG" ] || set -x
set -eo pipefail

ROOT="$(dirname $0)"

export KUBECONFIG=$ROOT/kubeconfig

echo "--> Provisioning KUBECONFIG=$KUBECONFIG ..."

k3d cluster create logstest \
  --agents 3 \
  --agents-memory 1GB \
  --servers-memory 512MB

kubectl create namespace logs
skaffold -n logs run --status-check=false

# Once this is done we can remove ./loki
echo "TODO adapt loki/test/ to unhelm loki-distributed"
