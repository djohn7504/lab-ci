#!/bin/bash

# Make sure the script fails when any of the commands fail.
set -e

echo "===================================="
echo "--------------- starting deploy..."
echo "--------------- $(uname)"
# Darwin, Linux, ?..
echo "===================================="


# OK
if git ls-remote --exit-code --tags origin release-test >/dev/null 2>&1 ; then
# BAD
#if [[ `git ls-remote --exit-code --tags origin release-test` ]]; then
  echo "OK exist on remote";
else
  echo "NOT exist on remote !!!";
fi



echo "===================================="
git tag --list
echo "===================================="
# To make it create such a tag if it does not yet exist:
git fetch origin refs/tags/release-test:refs/tags/release-test
echo "===================================="
#git status
git tag --list

echo "===================================="
git checkout tags/release-test
echo "===================================="
ls $TRAVIS_BUILD_DIR
