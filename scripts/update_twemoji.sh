#!/usr/bin/env bash
set -Eeuo pipefail
shopt -s inherit_errexit

script_dir="$(dirname "$(readlink -f -- "$0")")"

# Prepare dist directory
dist_dir="${script_dir}/../dist/twemoji"
mkdir -p -- "${dist_dir}/svg"

# Copy svg files
twemoji_dir="${TWEMOJI_DIR?required}"
rsync -va --delete --prune-empty-dirs --include='*.svg' --exclude='*' "${twemoji_dir}/" "${dist_dir}/svg/"

# Add aliases
pushd "${dist_dir}/svg" >/dev/null
cp '2620.svg' '2620-fe0f.svg'
cp '1f577.svg' '1f577-fe0f.svg'
cp '1f32a.svg' '1f32a-fe0f.svg'
cp '1f578.svg' '1f578-fe0f.svg'
cp '1f54a.svg' '1f54a-fe0f.svg'
cp '1f3f5.svg' '1f3f5-fe0f.svg'
cp '1f43f.svg' '1f43f-fe0f.svg'
cp '1f336.svg' '1f336-fe0f.svg'
popd >/dev/null

printf 'Done!\n'
exit 0
