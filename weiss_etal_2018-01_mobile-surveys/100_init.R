### 100_init.R --- 
## 
## Filename: 100_init.R
## Description: 
## Author: 
## Maintainer: 
## Created: Mo Sep 11 19:39:31 2017 (+0200)
## Version: 
## Package-Requires: ()
## Last-Updated: Mi Nov 22 14:37:10 2017 (+0100)
##           By: weissbd
##     Update #: 11
## URL: 
## Doc URL: 
## Keywords: 
## Compatibility: 
## 
######################################################################
## 
### Commentary: 
##  Analyses for a book chapter on "Mobile surveys" (Mobile Befragungen). Full
##  bibliographic reference. Weiß, Bernd, Henning Silber, Bella Struminskaya,
##  und Gabriele B. Durrant. 2018. Mobile Befragungen. In Handbuch Methoden der
##  empirischen Sozialforschung, Hrsg. Nina Baur und Jörg Blasius,
##  xxxx–xxxx. Springer VS.
## 
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

ea <- read.dta13 (paste0(path_data, "/ZA5664_v20-0-0.dta"), convert.factors = FALSE)

ea[ea < 0] <- NA

## Generate wave ids until wave_id_max.
wave_id_max <- "ea"
wave_id <- expand.grid(letters[2:5], letters[1:6])
wave_id <- arrange(wave_id, Var1)
wave_id <- paste0(wave_id$Var1, wave_id$Var2)
## Remove last five elements since these waves havn't been published yet.
wave_id_n <- which(wave_id == wave_id_max)
wave_id <- wave_id[1 : wave_id_n]
wave_id    


## Generate age groups.
summary(ea$a11d172a)
ea$age_groups <- cut(ea$a11d172a, breaks = c(18, seq(25, 45, 10), 75))
table(ea$age_groups)


## Online sample.
ea_online <- subset(ea, a11a167a == 1)


## Create character vectors that store wave-specific variable names.

## Vector of variable names for device type among all waves.
vn_device_type <- paste0(wave_id, "zq014a")

## Store variable names for survey location in character vector vn_survey_location.
vn_survey_location <- paste0(wave_id, "zq013a")



######################################################################
### 100_init.R ends here
