#!/bin/bash

echo "===================================="
echo "--------------- starting deploy..."
echo "===================================="

rm -rf out || exit 0;
git clone --branch "gh-pages" https://github.com/djohn7504/lab-ci.git "out"
cd out


# BSD/macOS	sed -i "" "$@"
# GNU 	sed -i -- "$@"


if [ $TRAVIS ] && [ $TRAVIS_OS_NAME = "linux" ]; then
  echo "Hello Travis CI, $TRAVIS_OS_NAME"
  textSearch="Hello Linux"
  textSearch="Hello Linux.*)"
  textReplace="Hello Linux (build $TRAVIS_BUILD_NUMBER)"
  sedComportment=""
  targetFile="./index.html"
  sed -i -- "s/.*$textSearch.*/$textReplace/$sedComportment" "./$targetFile"
  git add .
  git commit -m "Deployed to Github Pages"
  git push --force --quiet "https://${GITHUB_TOKEN}@github.com/djohn7504/lab-ci"



elif [ $TRAVIS ] && [ $TRAVIS_OS_NAME = "osx" ]; then
  echo "Hello Travis CI, $TRAVIS_OS_NAME"
  textSearch="Hello macOS"
  textReplace="Hello macOS (build $TRAVIS_BUILD_NUMBER)"
  sedComportment=""
  targetFile="./index.html"
  sed -i "" "s/.*$textSearch.*/$textReplace/$sedComportment" "./$targetFile"
  git add .
  git commit -m "Deployed to Github Pages"
  git push --force --quiet "https://${GITHUB_TOKEN}@github.com/djohn7504/lab-ci"



elif [ $APPVEYOR ]; then
  echo "Hello AppVeyor CI, $PLATFORM"
  
#  *** Please tell me who you are.
#  to set your account's default identity.
#  Omit --global to set the identity only in this repository.
git config --global user.email "djohn7504@gmail.com"
git config --global user.name "djohn7504"
  
  textSearch="Hello Windows"
  textReplace="Hello Windows (build $APPVEYOR_BUILD_VERSION)"
  sedComportment=""
  targetFile="./index.html"
  sed -i -- "s/.*$textSearch.*/$textReplace/$sedComportment" "./$targetFile"
  git status
  git add .
  git commit -m "Deployed to Github Pages"
  GITHUB_TOKEN=fe8a4ae5169d802c1b527efa4e6b22349a6e811c
# git push --force --quiet "https://${GITHUB_TOKEN}@github.com/djohn7504/lab-ci"
  git push --force --quiet "https://$GITHUB_TOKEN@github.com/djohn7504/lab-ci"



else
  echo "Hello UNKNOW";
  exit 0;



fi
