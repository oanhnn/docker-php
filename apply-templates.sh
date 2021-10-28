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

declare -A default_suites=(
    [alpine]='alpine3.14'
    [debian]='buster'
)

# Get "versions.json" first
if [ ! -f versions.json ]; then
    wget -qO versions.json 'https://raw.githubusercontent.com/docker-library/php/master/versions.json'
fi

# Make sure that program ".jq-template.awk" is installed
jqt='.jq-template.awk'
if [ -n "${BASHBREW_SCRIPTS:-}" ]; then
    jqt="$BASHBREW_SCRIPTS/jq-template.awk"
elif [ "$BASH_SOURCE" -nt "$jqt" ]; then
    wget -qO "$jqt" 'https://github.com/docker-library/bashbrew/raw/5f0c26381fb7cc78b2d217d58007800bdcfbcfa1/scripts/jq-template.awk'
fi

# If you do not specify any version as argument, all versions will be used as argument
if [ "$#" -eq 0 ]; then
    versions="$(jq -r 'keys | map(@sh) | join(" ")' versions.json)"
    eval "set -- $versions"
fi

for version; do
    export version

    # latest version
    latest="$(jq -r '.[env.version].version' versions.json)" # "8.0.8", etc

    # remove rc dir
    if [ -d "$version-rc" ]; then
        rm -rf "$version-rc"
    fi

    variants="$(jq -r '.[env.version].variants | map(@sh) | join(" ")' versions.json)"
    eval "variants=( $variants )"
    for dir in "${variants[@]}"; do
        suite="$(dirname "$dir")" # "buster", etc
        variant="$(basename "$dir")" # "cli", etc
        export suite variant

        alpineVer="${suite#alpine}" # "3.12", etc
        if [ "$suite" != "$alpineVer" ]; then
            distro='alpine'
        else
            distro='debian'
        fi

        if [ "${default_suites[$distro]:-}" = "$suite" ]; then
            echo "processing $version/$dir ..."

            template="Dockerfile-$distro.gtpl"
            from="$latest-$variant-$suite"
            export from

            target_dir="$version/$variant"
            if [ 'alpine' == "$distro" ]; then
                target_dir="$target_dir-alpine"
            fi
            mkdir -p $target_dir

            {
                generated_warning
                gawk -f "$jqt" "$template"
            } > "$target_dir/Dockerfile"
        else
            echo "skip $version/$dir ..."
        fi
    done
done
