#!/bin/bash

# Make sure the script fails when any of the commands fail.
set -e

BRANCH_NAME=gh-pages

echo "===================================="
echo "--------------- starting deploy to $BRANCH_NAME.."
echo "--------------- $(uname)"
# Darwin, Linux, ?..
echo "===================================="






echo "===================================="
git branch
#git checkout $BRANCH_NAME
echo "===================================="
ls $TRAVIS_BUILD_DIR
