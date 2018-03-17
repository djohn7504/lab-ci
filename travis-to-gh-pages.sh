#!/bin/bash

# Make sure the script fails when any of the commands fail.
set -e

echo "===================================="
echo "--------------- starting deploy..."
echo "===================================="

if [ $(git ls-remote --exit-code --tags origin release-test) ]; then
  echo "OK exist";
else
  echo "NOT exist !!!";
fi
