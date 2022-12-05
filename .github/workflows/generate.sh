#!/usr/bin/env bash
set -Eeuo pipefail

# Get "versions.json" first
if [ ! -f versions.json ]; then
    wget -qO versions.json 'https://raw.githubusercontent.com/docker-library/php/master/versions.json'
fi

versions="$(jq -r 'keys | map(@sh) | join(" ")' versions.json)"
dirs=$(echo */*)
json='{"include":[]}'

for dir in $dirs; do
    version=${dir%/*}
    variant=${dir##*/}
    # echo "Generating $dir => $version/$variant ..."

    if [[ ! "${versions[*]}" =~ "'${version}'" ]]; then
        continue
    fi

    export version
    if jq -e '.[env.version] | not' versions.json > /dev/null; then
        continue
    fi

    experimental=false
    if [[ ${version:(-3)} == "-rc" ]]; then
        experimental=true
    fi

    json=$(echo $json | jq '.include[.include|length] |= {"php": "'"$version"'", "variant": "'"$variant"'", "experimental": "'"$experimental"'"}')
done

echo $json
