#!/bin/bash
set -Eeuo pipefail

# Prepare dist directory
dist_dir="$(dirname "$(readlink -f "$0")")/../dist/twemoji"
mkdir -p "$dist_dir"
mkdir -p "${dist_dir}/svg"

# Prepare temp directory
tmp_dir="$(mktemp -d)"
if [ -z "$tmp_dir" ]; then
  echo 'Error: empty tmp_dir' >&2
  exit 1
fi
clean_tmp_dir() {
  rm -rf "$tmp_dir"
}
trap clean_tmp_dir INT TERM EXIT

# Close twemoji repository
temoji_dir="${tmp_dir}/twemoji"
git clone --depth 1 'https://github.com/twitter/twemoji.git' "$temoji_dir"

# Copy svg files
find "${temoji_dir}/assets/svg" -name '*.svg' -print0 | while IFS= read -r -d '' src; do
  dst="${dist_dir}/svg/$(basename "$src")"
  cp "$src" "$dst"
done

exit 0
