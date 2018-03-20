

echo =================================================
echo - starting deploy to GitHub Pages.. (Docs folder)
echo =================================================
echo:


::git fetch --unshallow --tags
git checkout master


echo:>>Docs\README.md
echo ^#^#^#^# AppVeyor CI (build %appveyor_build_version%)>>Docs\README.md
git add Docs\README.md
:: *********************************************************************************
:: IMPORTANT: [skip ci] to avoid infinite loop !!!
:: *********************************************************************************
git commit --message "Update GitHub Pages. (Docs folder) [skip ci]"
::git push --force --quiet "https://%GITHUB_TOKEN%@github.com/djohn7504/lab-ci"
git push "https://%GITHUB_TOKEN%@github.com/djohn7504/lab-ci"
