#!/bin/bash

# Make sure the script fails when any of the commands fail.
set -e


echo "" >> Docs/README.md
echo "#### Travis CI (build $TRAVIS_BUILD_NUMBER)" >> Docs/README.md
git add Docs/README.md
# *********************************************************************************
# IMPORTANT: [skip ci] to avoid infinite loop !!!
# *********************************************************************************
git commit --message "Update GitHub Pages. (Docs folder) [skip ci]"
git push --force --quiet "https://$GITHUB_TOKEN@github.com/djohn7504/lab-ci"
