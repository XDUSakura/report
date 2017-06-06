#!/bin/bash

##
## Install Environment
##

echo Begin

## update apt
sudo apt update
## install
sudo apt-get -y install xfonts-wqy
sudo apt install -y --no-install-recommends texlive-full
sudo apt install -y --no-install-recommends wget texlive-base texlive-xetex latex-xcolor xzdec \
     texlive-fonts-recommended texlive-latex-extra lmodern texlive-latex-recommended
# create texmf
cd ~ && mkdir texmf
tlmgr init-usertree
# update packages
tlmgr update --all
tlmgr install ctex l3kernel xecjk l3packages latex
tlmgr install geometry fontspec fandol ulem zhnumber
# return to work path
cd $TRAVIS_BUILD_DIR
