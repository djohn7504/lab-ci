#!/bin/bash

# Make sure the script fails when any of the commands fail.
set -e

echo "===================================="
echo "--------------- starting deploy..."
echo "--------------- $(uname)"
# Darwin, Linux, ?..
echo "===================================="



#if [ $(git ls-remote --exit-code --tags origin release-test) ]; then
#  echo "OK exist";
#else
#  echo "NOT exist !!!";
#fi




# To make it create such a tag if it does not yet exist:
# git fetch origin refs/tags/1.0.0:refs/tags/1.0.0
git fetch origin refs/tags/release-test:refs/tags/release-test


ls $TRAVIS_BUILD_DIR
