#!/usr/bin/env bash
set -Eeuo pipefail

# Generate warning "PLEASE DO NOT EDIT IT DIRECTLY"
generated_warning() {
    cat <<-EOH
#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "apply-templates.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
EOH
}

# Get "versions.json" first
if [ ! -f versions.json ]; then
    wget -qO versions.json 'https://raw.githubusercontent.com/docker-library/php/master/versions.json'
fi

# Make sure that program ".jq-template.awk" is installed
jqt='.jq-template.awk'
if [ -n "${BASHBREW_SCRIPTS:-}" ]; then
    jqt="$BASHBREW_SCRIPTS/jq-template.awk"
elif [ "$BASH_SOURCE" -nt "$jqt" ]; then
    # https://github.com/docker-library/bashbrew/blob/master/scripts/jq-template.awk
    wget -qO "$jqt" 'https://github.com/docker-library/bashbrew/raw/9f6a35772ac863a0241f147c820354e4008edf38/scripts/jq-template.awk'
fi

# If you do not specify any version as argument, all parsed versions will be used as argument
if [ "$#" -eq 0 ]; then
    versions="$(jq -r 'keys | map(@sh) | join(" ")' versions.json)"
    eval "set -- $versions"
fi

for version; do
    export version # "8.0", etc

    if [ -d "$version" ]; then
        rm -rf "$version"
    fi

    if jq -e '.[env.version] | not' versions.json > /dev/null; then
        echo "deleting $version ..."
        continue
    fi

    # latest version
    latest="$(jq -r '.[env.version].version' versions.json)" # "8.0.8", etc

    variants="$(jq -r '.[env.version].variants | map(@sh) | join(" ")' versions.json)"
    eval "variants=( $variants )"
    for dir in "${variants[@]}"; do
        suite="$(dirname "$dir")" # "buster", etc
        variant="$(basename "$dir")" # "cli", etc
        export suite variant

        alpineVer="${suite#alpine}" # "3.12", etc
        if [ "$suite" != "$alpineVer" ]; then
            distro='alpine'
            from="php:$latest-$variant-alpine"
            target_dir="$version/$variant-alpine"
        else
            distro='debian'
            from="php:$latest-$variant"
            target_dir="$version/$variant"
        fi
        export from distro alpineVer

        # Generate Dockerfile
        if [ ! -d "$target_dir" ] && [[ 'alpine' != "$distro" || 'apache' != "$variant" ]]; then
            echo "generate $target_dir ..."
            mkdir -p "$target_dir"
            {
                generated_warning
                gawk -f "$jqt" "Dockerfile-$distro.gtpl"
            } > "$target_dir/Dockerfile"
        fi

    done
done
