echo off
set /P var123="Commit comment: "
echo on

git add .
git commit -m "%var123%"
git push origin master_pt

pause