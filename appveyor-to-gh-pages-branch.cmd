

echo =================================================
echo --------------- starting deploy to GitHub Pages..
echo =================================================
echo:

:: where..
mkdir out
cd out

:: permission..
git config --global user.email "djohn7504@gmail.com"
git config --global user.name "djohn7504"

:: what..
git clone --branch "gh-pages" https://github.com/djohn7504/lab-ci.git .

:: modify..
echo:>>README.md
echo ^#^#^#^# AppVeyor CI (build %appveyor_build_version%)>>README.md
git add README.md
::git commit --message "Update GitHub Pages."
git commit --message "Update GitHub Pages.[skip ci]"

:: send..
git push --force --quiet "https://%GITHUB_TOKEN%@github.com/djohn7504/lab-ci"

:: cleanup..
cd ..
