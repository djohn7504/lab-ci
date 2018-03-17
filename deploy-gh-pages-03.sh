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
  echo "Hello AppVeyor CI, $APPVEYOR_BUILD_WORKER_IMAGE, $PLATFORM"
  
  userName="djohn7504"
  userEmail="pQeGEHz0da4XUuwqVNWlsLCmqR7cl8+CFYpUIYyeQ1A="
  userPass="2BK7oulygG/SwBWn8wT2bw=="

#  *** Please tell me who you are.
#  to set your account's default identity.
#  Omit --global to set the identity only in this repository.
git config --global user.email "$userEmail"
git config --global user.name "$userName"
# ?..
git remote set-url lab-ci https://$userName:$userPass@github.com/$userName/lab-ci.git
  
  textSearch="Hello Windows"
  textReplace="Hello Windows (build $APPVEYOR_BUILD_VERSION)"
echo "===================================="
  echo $textReplace
  sedComportment=""
  targetFile="./index.html"
echo "===================================="
  cat index.html
echo "===================================="
# sed -i -- "s/.*$textSearch.*/$textReplace/$sedComportment" "./$targetFile"
# ps: cat index.html | %{$_ -replace ".*Hello Windows.*", "$textReplace"} > index.html
  cat index.html
echo "===================================="
  git status
echo "===================================="
  git add .
  git commit -m "Deployed to Github Pages"
  git status
echo "===================================="
  GITHUB_TOKEN="fe8a4ae5169d802c1b527efa4e6b22349a6e811c"
# git push --force --quiet "https://${GITHUB_TOKEN}@github.com/djohn7504/lab-ci"
  git push --force --quiet "https://$GITHUB_TOKEN@github.com/$userName/lab-ci"



else
  echo "Hello UNKNOW !";
  exit 0;



fi
