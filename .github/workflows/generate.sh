#!/usr/bin/env bash
set -Eeuo pipefail

versions="7.4 8.0 8.0-rc 8.1 8.1-rc"
dirs=$(echo */*)
json='{"include":[]}'

for i in $dirs; do
  echo "Generating $i"
  if [[ " ${versions[*]} " =~ " ${i%/*} " ]]; then
    echo "PHP ${i%/*}"
    echo "Variable ${i##*/}"

    json=$(echo $json | jq '.include[.include|length] |= {"php": "'"${i%/*}"'", "variables": "'"${i##*/}"'"}')
  fi
done

echo $json
