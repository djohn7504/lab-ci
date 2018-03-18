#!/bin/bash

# Make sure the script fails when any of the commands fail.
set -e

TAG_NAME=release-test

echo "===================================="
echo "--------------- starting deploy to $TAG_NAME.."
echo "--------------- $(uname)"
# Darwin, Linux, ?..
echo "===================================="


if [ $(git tag --list "$TAG_NAME" == $TAG_NAME) ] ; then
  echo "use the local $TAG_NAME:";
  echo "-------------";
  git checkout release-test
  git show $TAG_NAME
  # ..

elif git ls-remote --exit-code --tags origin $TAG_NAME >/dev/null 2>&1 ; then
  echo "use the remote $TAG_NAME:";
  echo "--------------";
  # need download ?..

else
  echo "$TAG_NAME NOT exist !!!";
  # need create ?..

fi



echo "===================================="
ls $TRAVIS_BUILD_DIR
