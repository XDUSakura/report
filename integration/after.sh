#!/bin/bash

##
## Update to repo
##

# Check api environment variable
if [ -n "$GITHUB_API_KEY" ]; then
  # Setting name
  git config --global user.name "travis_auto"
  # Setting email
  git config --global user.email "qinka@live.com"
  # change dir
  cd ~
  #clone
  git clone https://qinka:$GITHUB_API_KEY@github.com/DingoLab/DingoRelease.git
  # change work dir
  cd DingoRelease
  # checkout branch
  git checkout add-template
  export BRANCH_NAME=update/`date +%Y%m%d%H%M%S%N`
  git branch $BRANCH_NAME
  git checkout $BRANCH_NAME
  # Setting path
  export REPO_PATH=$(pwd)
  # copy files
  cp "$TRAVIS_BUILD_DIR"/*.pdf .
  # add
  git add .
  # commit
  git commit -am"travis-ci;\n $(date)"
  # push to remote repo
  git push origin master
  # back
  cd ~
  # delete
  sudo rm -rf $RELPATH
  # back
  cd "$TRAVIS_BUILD_DIR"
fi