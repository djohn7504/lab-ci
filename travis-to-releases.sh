#!/bin/bash

# Make sure the script fails when any of the commands fail.
set -e

TAG_NAME=release-test

echo "===================================="
echo "--------------- starting deploy to $TAG_NAME.."
echo "--------------- $(uname)"
# Darwin, Linux, ?..
echo "===================================="


if [[ `git tag --list $TAG_NAME` == $TAG_NAME ]]; then
  echo "$TAG_NAME exist on local";
else
  echo "$TAG_NAME NOT exist on local !!!";
fi

echo "===================================="

if git ls-remote --exit-code --tags origin $TAG_NAME >/dev/null 2>&1 ; then
  echo "$TAG_NAME exist on remote";
  #git fetch origin refs/tags/release-test:refs/tags/release-test
else
  echo "$TAG_NAME NOT exist on remote !!!";
fi


echo "===================================="
echo "fetch:"
# To make it create such a tag if it does not yet exist:
#git fetch origin refs/tags/test-01:refs/tags/test-01
echo "===================================="
echo "tag list:"
git tag --list
echo "===================================="
echo "checkout tag:"
#git checkout tags/release-test
echo "===================================="
ls $TRAVIS_BUILD_DIR
