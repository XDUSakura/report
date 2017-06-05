#!/bin/bash

##
## Install Environment
##

echo Begin

## update apt
sudo apt update
## install
sudo apt install -y --no-install-recommends wget texlive-base texlive-xetex latex-xcolor xzdec \
  texlive-fonts-recommended texlive-latex-extra lmodern texlive-latex-recommended
# create texmf
cd ~ && mkdir texmf
tlmgr init-usertree
# update packages
sudo tlmgr update --all
sudo tlmgr install ctex l3kernel xecjk l3packages latex
sudo tlmgr install geometry fontspec fandol ulem zhnumber
# return to work path
cd $TRAVIS_BUILD_DIR