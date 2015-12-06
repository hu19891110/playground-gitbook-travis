#!/bin/bash

set -o errexit -o nounset

rev=$(git rev-parse --short HEAD)

cd _book

git init
git config user.name "Dan Korostelev"
git config user.email "nadako@gmail.com"

git remote add upstream "https://$GH_TOKEN@github.com/nadako/playground-gitbook-travis.git"
git fetch upstream
git reset upstream/gh-pages

touch .

git add -A .
git commit -m "rebuild pages at ${rev}"
git push -q upstream HEAD:gh-pages
