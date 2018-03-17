#!/bin/bash

# Make sure the script fails when any of the commands fail.
set -e

echo "===================================="
echo "--------------- starting deploy..."
echo "--------------- $(uname)"
# Darwin, Linux, ?..
echo "===================================="



echo "===================================="
# To make it create such a tag if it does not yet exist:
git fetch origin refs/tags/test-01:refs/tags/test-01
echo "===================================="
git checkout tags/release-test
echo "===================================="
ls $TRAVIS_BUILD_DIR
