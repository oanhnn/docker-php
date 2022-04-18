#!/usr/bin/env bash
set -Eeuo pipefail

versions="7.4 8.0 8.0-rc 8.1 8.1-rc"
dirs=$(echo */*)
json='{"include":[]}'

for i in $dirs; do
  # echo "Generating $i"
  php=${i%/*}
  variant=${i##*/}
  if [[ " ${versions[*]} " =~ " $php " ]]; then
    json=$(echo $json | jq '.include[.include|length] |= {"php": "'"$php"'", "variant": "'"$variant"'"}')
  fi
done

echo $json
