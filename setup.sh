
#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"

cargo init
git rm README.md setup.sh
git add -A
git commit -m "Bootstraped using setup.sh"
git push
