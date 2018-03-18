#!/bin/bash

# Make sure the script fails when any of the commands fail.
set -e

TAG_NAME=release-test
TAG_NAME=gh-pages

echo "===================================="
echo "--------------- starting deploy to $TAG_NAME.."
echo "--------------- $(uname)"
# Darwin, Linux, ?..
echo "===================================="




if (git ls-remote --exit-code --tags origin $TAG_NAME >/dev/null 2>&1) ; then
  echo "$TAG_NAME exist on remote";
else
  echo "$TAG_NAME NOT exist on remote !!!";
fi



echo "===================================="
git tag --list
echo "===================================="
# To make it create such a tag if it does not yet exist:
#git fetch origin refs/tags/release-test:refs/tags/release-test

echo "===================================="
#git status
git tag --list

echo "===================================="
git checkout tags/release-test
echo "===================================="
ls $TRAVIS_BUILD_DIR
