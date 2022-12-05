############################################################################################
#### LESSON 3: FROM LM TO LMM                                                           ####
#### ========================                                                           ####
#### This worksheet contains an incomplete version of the code presented in the lesson. ####
#### Fill in all ... with code.                                                         ####
############################################################################################
############################################################################################

library(tidyverse)
library(lme4)
library(lmerTest)
library(easystats)

soilN_biomass <- read_csv('datasets/...')

summary(...)
glimpse(...)

lm_fit <- ...(... ~ ..., data = ...)

...(lm_fit)

lm_coefs <- ...(lm_fit)

lm_coefs

mm_fit <- ...(biomass ~ soilN + (...|...), data = soilN_biomass)

mm_fit_randomslopes <- lmer(... ~ ... + (...|...), data = soilN_biomass)

check_model(mm_fit_randomslopes)

summary(mm_fit_randomslopes)

ranef(...)
fixef(...)
coef(...)

anova(mm_fit_randomslopes)

fert_biomass <- read_csv('datasets/fertilizer_biomass.csv') %>%
  ...(treatment = ...(treatment, ... = c('control', 'low', 'high')))

fert_mm <- lmer(... ~ ..., data = fert_biomass)

summary(fert_mm)

fert_mm_slopes <- ...(... ~ ... + (... | ...), data = fert_biomass)

ranef(...)

VarCorr(...)


# Exercises ---------------------------------------------------------------

# Load data for Exercises 2-5

fish_fillets <- read_csv('datasets/fish_fillets.csv')
