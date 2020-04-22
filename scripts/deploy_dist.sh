#!/bin/bash
set -Eeuo pipefail

git subtree push --prefix dist origin gh-pages
exit 0
