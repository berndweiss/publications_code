### 300_ana.R --- 
## 
## Filename: 300_ana.R
## Description: 
## Author: 
## Maintainer: 
## Created: Mo Sep 11 19:38:43 2017 (+0200)
## Version: 
## Package-Requires: ()
## Last-Updated: Mi Nov 22 14:35:04 2017 (+0100)
##           By: weissbd
##     Update #: 60
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


## -------------------------------------------------------------------------- ##
## +++ Prevalence usage mobile devices by age (Fig. 2)                        ##
## -------------------------------------------------------------------------- ##


## Descriptive stats for device type. 
summary(ea_online[vn_device_type])


## Generate new dummy variable for device type (1: mobile device, 0: non mobile
## device).
## Generate empty vectors for new variables.
ea_online[, paste0(vn_device_type, "_smart")] <- NA
ea_online[, paste0(vn_device_type, "_tablet")] <- NA
## Temporary function to dichotomize by device type.
tmp_lambda <- function(x, type){
    tmp <- x %in% type
    tmp[is.na(x)] <- NA
    return(tmp)
}
ea_online[, paste0(vn_device_type, "_smart")] <-  apply(ea_online[, vn_device_type],
                                                  2, tmp_lambda, type = 3)
ea_online[, paste0(vn_device_type, "_tablet")] <-  apply(ea_online[, vn_device_type],
                                                  2, tmp_lambda, type = 2)



## Returns a 5 x 20 tibble (actually, it should be 4 age groups, the NA group
## will be removed later on), the mean of the dummy variable smartphone use by
## age group (lines) and over all waves (variables) (wide format).
ea_online[, c(paste0(vn_device_type, "_smart"), "age_groups")] %>%
    group_by(age_groups) %>%
    summarise_all(mean, na.rm = TRUE) -> tmp_m_smart_age_groups
ea_online[, c(paste0(vn_device_type, "_tablet"), "age_groups")] %>%
    group_by(age_groups) %>%
    summarise_all(mean, na.rm = TRUE) -> tmp_m_tablet_age_groups
## Reshape wide-format tibbles to long format. 
tmp_m_smart_age_groups %>% gather("variable", "mean", -age_groups) %>%
    drop_na() -> tmp_m_smart_age_groups_df
tmp_m_tablet_age_groups %>% gather("variable", "mean", -age_groups) %>%
    drop_na() -> tmp_m_tablet_age_groups_df


n <- length(unique(tmp_m_tablet_age_groups_df$age_groups))


## Combine two factors; let's do this outside of the following data.frame call
## to save space.
tmp_age_groups_factor <- factor(c(as.character(tmp_m_smart_age_groups_df$age_groups),
                                  as.character(tmp_m_smart_age_groups_df$age_groups)))
## Combine the smartphone and tablet data (in long format). The resulting data
## set has a length of (19 waves x 6 age groups x 2 factors (smartphone and
## tablet)) = 228.
tmp_df_age_devtype <- data.frame(wave = c(sort(rep(wave_id, n)),  sort(rep(wave_id, n))),
                                 type = c(rep("Smartphone", n * length(wave_id)),
                                          rep("Tablet", n * length(wave_id))),
                                 age_group = tmp_age_groups_factor,
                                 m = unlist(c(tmp_m_smart_age_groups_df$mean,
                                             tmp_m_tablet_age_groups_df$mean)))
                             

## Plot means device type by wave and age groupe.
ggplot(aes(x = wave, y = m * 100, group = type, linetype = type, shape = type),
       data = tmp_df_age_devtype) +
    geom_point(size = 6) + geom_line(lwd = 2) +
    facet_wrap(~ age_group) + theme_bw() +
    theme(text = element_text(size = 25),
          panel.spacing = unit(1, "lines")) +
    ylim(0, 40) + 
    labs(linetype = "Mobilger\344t", shape = "Mobilger\344t") +
    xlab("Jahr") + ylab("Prozent") +
    scale_x_discrete(breaks = c("ba", "ca", "da", "ea"), labels = c(2014, 2015, 2016, 2017)) +
    scale_linetype_manual(values=c("twodash", "solid")) +
    scale_shape_manual(values=c(15, 16))
ggsave(paste0(path_figure, "/f_gp_plot_agegroups.wmf"), width = 20)
ggsave(paste0(path_figure, "/f_gp_plot_agegroups.pdf"), width = 20)


######################################################################
### 300_ana.R ends here
