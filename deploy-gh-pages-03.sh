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
  sed -i -- "s/$textSearch/$textReplace/$sedComportment" "./$targetFile"
  git add .
  git commit -m "Deployed to Github Pages"
  git push --force --quiet "https://${GITHUB_TOKEN}@github.com/djohn7504/lab-ci"



elif [ $TRAVIS ] && [ $TRAVIS_OS_NAME = "osx" ]; then
  echo "Hello Travis CI, $TRAVIS_OS_NAME"
  textSearch="Hello macOS"
  textReplace="Hello macOS (build $TRAVIS_BUILD_NUMBER)"
  sedComportment=""
  targetFile="./index.html"
# sed -i -- "s/$textSearch/$textReplace/$sedComportment" "./$targetFile"
  sed -i "" "s/$textSearch/$textReplace/$sedComportment" "./$targetFile"
  git add .
  git commit -m "Deployed to Github Pages"
  git push --force --quiet "https://${GITHUB_TOKEN}@github.com/djohn7504/lab-ci"



elif [ $APPVEYOR ]; then
  echo "Hello AppVeyor CI, $PLATFORM"
  textSearch="Hello Windows"
  textReplace="Hello Windows (build $APPVEYOR_BUILD_VERSION)"
  sedComportment=""
  targetFile="./index.html"
# sed -i -- "s/$textSearch/$textReplace/$sedComportment" "./$targetFile"
  sed -i -- "s/.*$textSearch.*/$textReplace/$sedComportment" "./$targetFile"
  git add .
  git commit -m "Deployed to Github Pages"
# GITHUB_TOKEN=7RRqPIF4QkklZNMCs/INNpMUiiYad2N3zxkzgMc6isuBdd95NuoImqA9fzOvrjHg
  GITHUB_TOKEN=803f6f67f460113ad3cc5e1229958d7ff7b4bbb1
# git push --force --quiet "https://${GITHUB_TOKEN}@github.com/djohn7504/lab-ci"
  git push --force --quiet "https://$GITHUB_TOKEN@github.com/djohn7504/lab-ci"



else
  echo "Hello UNKNOW";
  exit 0;



fi
