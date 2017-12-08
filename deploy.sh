#!/bin/bash
set -o errexit -o nounset
PKG_REPO=$PWD
COMMIT="${TRAVIS_COMMIT:-$APPVEYOR_REPO_COMMIT}"
cd ..

mkdir repo
cd repo

## Set up Repo parameters
git init
git config user.name "DeclareDesign Travis"
git config user.email "team@declaredesign.org"
git config push.default simple

## Get drat repo
git remote add upstream "https://$GH_TOKEN@github.com/DeclareDesign/declaredesign.github.io.git"
git fetch upstream
git checkout master

echo "Beginning update_repo.R from deploy.sh"
Rscript update_repo.R
echo "Complete update_repo.R from deploy.sh, proceeding with git commits."

git add *
git commit -m "Travis update $PKG_REPO build $COMMIT"

git push
