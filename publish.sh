#!/usr/bin/env bash

# ssh-add -l
# ssh-add ~/.ssh/vraciul-urban.ro/id_ed25519

find ../vraciul-urban.github.io/ -mindepth 1 -maxdepth 1 -type d -not -path '*/\.*' -exec rm -r {} \;
find ../vraciul-urban.github.io/ -mindepth 1 -maxdepth 1 -type f -name '*ml' -exec rm -r {} \;

rm -rf public
hugo
yes | cp -f -r public/. ../vraciul-urban.github.io/
cd ../vraciul-urban.github.io/
git add .; git commit -m "wip"; git push origin master
echo "Don't forget to remove the last comment from scripts/bootstrap.bundle.min.js (related to scripts/bootstrap.bundle.min.js.map)"