### 000_index.R --- 
## 
## Filename: 000_index.R
## Description: 
## Author: 
## Maintainer: 
## Created: Di Sep 12 09:31:44 2017 (+0200)
## Version: 
## Package-Requires: ()
## Last-Updated: Mi Nov 22 15:15:17 2017 (+0100)
##           By: weissbd
##     Update #: 14
## URL: 
## Doc URL: 
## Keywords: 
## Compatibility: 
## 
######################################################################
## 
### Commentary: 
##
##  Analyses for a book chapter on "Mobile surveys" (Mobile Befragungen).
##
##  - Full bibliographic reference: Weiß, Bernd, Henning Silber, Bella
##    Struminskaya, und Gabriele B. Durrant. 2018. Mobile Befragungen. In
##    Handbuch Methoden der empirischen Sozialforschung, Hrsg. Nina Baur und
##    Jörg Blasius, xxxx–xxxx. Springer VS.
##
##  - Datasets used for these analyses: GESIS (2017): GESIS Panel Standard
##    Edition. ZA5665 Datenfile Version 18.0.0. Köln: GESIS Datenarchiv. DOI:
##    10.4232/1.12766
## 
##  - How to reproduce the analyses:
##    1. Obtain the above mentioned dataset(s).
##    2. Adjust file paths in 000_index.R, see section "Configuration".
##    3. Execute the R Code in 000_index.R. 
######################################################################
## 
### Change Log:
## 
## 
######################################################################
## 
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or (at
## your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
## 
######################################################################
## 
### Code:


## List of relevant variables: 
## - Besitz eines Smartphones: dfzi123a
## - Besitz eines Tablet-PCs: dfzi122a
## - Nutzungshäufigkeit eines Smartphones: dfzi127a
## - Nutzungshäufigkeit eines Tablet-PCs: dfzi126a
## - Teilnahmewahrscheinlichkeit an einer Umfrage mit Smartphone:
## - dfzi138a Teilnahmewahrscheinlichkeit an einer Umfrage mit Tablet-PC:
## - dfzi137a Präferierter Teilnahmemodus:
## - dfzi139a Teilnahmegerät (Welle df, online): dfzq014a
## - a11a167a 1: onliner 2: offliner


## -------------------------------------------------------------------------- ##
## +++ Load R packages                                                        ##
## -------------------------------------------------------------------------- ##


library(Hmisc)
library(foreign)
library(MASS)
library(readstata13)
library(gmodels)
library(base)
library(graphics)
library(car)
library(dplyr)
library(tidyr)




## -------------------------------------------------------------------------- ##
## +++ Configuration
## -------------------------------------------------------------------------- ##

path_data <- "E:/projects/gesis/gesis_panel/data/masterdatensatz/ea"
path_figure <- "E:/projects/publicat/article/pu2017mobile-befragungen-handbuch/fig"



## -------------------------------------------------------------------------- ##
## +++ Run analyses                                                           ##
## -------------------------------------------------------------------------- ##

source("100_init.R")
source("300_ana.R")


######################################################################
### 000_index.R ends here
