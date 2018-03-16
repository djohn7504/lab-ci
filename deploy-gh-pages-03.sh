#!/bin/bash

echo "===================================="
echo "--------------- starting deploy..."
echo "===================================="

rm -rf out || exit 0;

#mkdir out
#cd out

git clone --branch "gh-pages" https://github.com/djohn7504/lab-ci.git "out"
cd out


textSearch="\[linux\]"
textReplace="Hello Linux (build $TRAVIS_BUILD_NUMBER)"
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
#git push --force --quiet "https://${GITHUB_TOKEN}@github.com/djohn7504/lab-ci" master:gh-pages > /dev/null 2>&1
