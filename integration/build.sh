#!/bin/bash

##
## Build the documents
##

patch report.tex integration/linux-font.patch
## 重要的东西编译三遍
xelatex report.tex
xelatex report.tex
xelatex report.tex
