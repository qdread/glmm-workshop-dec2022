############################################################################################
#### LESSON 6: ESTIMATING AND COMPARING TREATMENT MEANS                                 ####
#### ==================================================                                 ####
#### This worksheet contains an incomplete version of the code presented in the lesson. ####
#### Fill in all ... with code.                                                         ####
############################################################################################
############################################################################################

library(tidyverse)
library(lme4)
library(emmeans)
library(multcomp)

fert_biomass <- read_csv('datasets/fertilizer_biomass.csv') %>%
  mutate(treatment = factor(treatment, levels = c('control', 'low', 'high')))

fert_mm <- lmer(..., data = fert_biomass)

theme_set(theme_bw())

fert_emm <- emmeans(fert_mm, ...)

plot(...)

...(fert_emm, method = ...)

contr_sidak <- ...(fert_emm, method = 'pairwise', ...)

plot(...)

plot(contr_sidak) + geom_vline(xintercept = 0, linetype = 'dashed', linewidth = 1)

...(..., adjust = 'sidak')

...(fert_emm, adjust = 'sidak', Letters = ...)

...(fert_emm, ... = 'trt.vs.ctrl')

data('stirret.borers', package = 'agridat')
## stirret.borers <- read_csv('datasets/stirret.borers.csv')

stirret.borers <- stirret.borers %>%
  mutate(trt = factor(trt, levels = c('None', 'Early', 'Late', 'Both')))

glmm_borers <- glmer(count2 ~ trt + (1|block), data = stirret.borers, family = poisson)

...(glmm_borers, ...)

emm_borers <- emmeans(glmm_borers, ..., type = ...)

contrast(emm_borers, method = ..., adjust = ...)

fish_fillets <- read_csv('datasets/fish_fillets.csv')
fit_fillets <- lmer(thickness ~ species + prep + species:prep + (1|fishID), data = fish_fillets)

emm_species <- ...(fit_fillets, ...)
emm_prep <- emmeans(...)

emm_species_x_prep <- emmeans(fit_fillets, ...)

cld(..., ..., Letters = letters)

emm_prep_within_species <- emmeans(fit_fillets, ...)

...(emm_prep_within_species, adjust = ..., Letters = letters)


# Exercises ---------------------------------------------------------------

# Load data and refit model for Exercises 1-3

data(jansen.apple, package = 'agridat')
## jansen.apple <- read_csv('datasets/jansen.apple.csv')

jansen.apple <- jansen.apple %>%
 mutate(inoculum = factor(inoculum))
fit_apples <- glmer(cbind(y, n - y) ~ gen + inoculum + gen:inoculum + (1|block), data = jansen.apple, family = binomial(link = 'logit'))
