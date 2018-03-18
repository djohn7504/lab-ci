#!/bin/bash

echo "===================================="
echo "--------------- starting deploy..."
echo "===================================="
git branch
echo "===================================="

rm -rf out || exit 0;

mkdir out
cd out

#git init
#git config user.name ${GIT_NAME}
#git config user.email ${GIT_EMAIL}
#git checkout master:gh-pages
#git checkout --orphan gh-pages
#git-checkout gh-pages
git checkout origin/gh-pages -b gh-pages

#cp ../deploy/index-linux.html ./index.html
echo "Travis CI (build $TRAVIS_BUILD_NUMBER)" >> index.html

#git add .
git add index.html
git commit -m "Deployed to Github Pages"
git push --force --quiet "https://${GITHUB_TOKEN_2}@github.com/djohn7504/lab-ci" master:gh-pages > /dev/null 2>&1
