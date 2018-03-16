#!/bin/bash

echo "===================================="
echo "--------------- starting deploy..."
echo "===================================="

if [ $TRAVIS ] && [ $TRAVIS_OS_NAME = "linux" ]; then
  echo "Hello Travis CI, $TRAVIS_OS_NAME"
  textSearch="Hello Linux"
  textSearch="Hello Linux.*)"
  textReplace="Hello Linux (build $APPVEYOR_BUILD_VERSION)"

elif [ $TRAVIS ] && [ $TRAVIS_OS_NAME = "osx" ]; then
  echo "Hello Travis CI, $TRAVIS_OS_NAME"
  textSearch="Hello macOS"
  textReplace="Hello macOS (build $APPVEYOR_BUILD_VERSION)"

elif [ $APPVEYOR ]; then
  echo "Hello AppVeyor CI, $PLATFORM"
  textSearch="Hello Windows"
  textReplace="Hello Windows (build $APPVEYOR_BUILD_VERSION)"

else
  echo "Hello UNKNOW";
  exit 0;

fi

rm -rf out || exit 0;
git clone --branch "gh-pages" https://github.com/djohn7504/lab-ci.git "out"
cd out


#textSearch="\[linux\]"
#textSearch="Hello Linux"
#textReplace="Hello Linux (build $TRAVIS_BUILD_NUMBER)"
sedComportment=""
targetFile="./index.html"

#	BSD/macOS		sed -i "" "$@"
#	GNU 			sed -i -- "$@"
	
	sed		-i --											\
			"s/$textSearch/$textReplace/$sedComportment"	\
			"./$targetFile"					
			#




git add .
git commit -m "Deployed to Github Pages"
git push --force --quiet "https://${GITHUB_TOKEN}@github.com/djohn7504/lab-ci"
