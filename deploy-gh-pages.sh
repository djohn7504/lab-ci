#!/bin/bash

echo "===================================="
echo "--------------- starting deploy..."
echo "===================================="

rm -rf out || exit 0;

mkdir out;

echo "starting deploy..."
( cd out
 git init
 git config user.name ${GIT_NAME}
 git config user.email ${GIT_EMAIL}
# cp -r ../public/* ./
# cp ../release/myproject.min.js ./scripts/myproject.min.js
 cp ../deploy/index-linux.html ./index.html
 git add .
 git commit -m "Deployed to Github Pages"
 git push --force --quiet "https://${GITHUB_TOKEN}@github.com/djohn7504/lab-ci" master:gh-pages > /dev/null 2>&1
)
