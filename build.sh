#!/usr/bin/env bash
set -e # stop on error

echo building ...
npm run build

echo check out branch gh-pages ...
git checkout -b gh-pages

echo add build/es5-bundled folder
git add -f build/es5-bundled

echo commit changes
git commit -m "deploy to gh-pages"

echo push to remote gh-pages
git push origin `git subtree split --prefix build/es5-bundled`:gh-pages --force

echo checkout branch master
git checkout master

echo delete branch gh-pages
git branch -D gh-pages
echo All done!
