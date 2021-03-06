#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"

cargo init
echo "\n[[bin]]\nname =\"app\"\npath = \"src/main.rs\"\n" >> Cargo.toml
git rm README.md setup.sh
git add -A
git commit -m "Bootstraped using setup.sh"
git push
