#!/bin/bash
set -e

rev=$(git rev-parse --short HEAD)

cd _book

git init
git config user.name "Travis CI"
git config user.email "nadako@gmail.com"

git add .
git commit -m "Build from ${rev}"

git push --force --quiet "https://${GH_TOKEN}@github.com/nadako/playground-gitbook-travis.git" master:gh-pages > /dev/null 2>&1
