

echo =================================================
echo --------------- starting deploy to GitHub Pages..
echo =================================================
echo:

echo:>>Docs\README.md
echo ^#^#^#^# AppVeyor CI (build %appveyor_build_version%)>>Docs\README.md
git add Docs\README.md
:: *********************************************************************************
:: IMPORTANT: [skip ci] to avoid infinite loop !!!
:: *********************************************************************************
git commit --message "Update GitHub Pages. (Docs folder) [skip ci]"
git push --force --quiet "https://%GITHUB_TOKEN%@github.com/djohn7504/lab-ci"
