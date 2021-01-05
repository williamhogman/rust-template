
#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"

cargo init
git rm README.md setup.sh
#git commit -m "Bootstraped using setup.sh"
