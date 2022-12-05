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

soilN_biomass <- read_csv('datasets/soilN_biomass.csv')

## soilN_biomass
## 
## summary(soilN_biomass)
## 
## glimpse(soilN_biomass)

ggplot(soilN_biomass, aes(x = soilN, y = biomass, color = field)) +
  geom_point(size = 1.5) +
  theme_bw()

lm_fit <- lm(biomass ~ soilN, data = soilN_biomass)

summary(lm_fit)

lm_coefs <- coef(lm_fit)

lm_coefs

ggplot(soilN_biomass, aes(x = soilN, y = biomass, color = field)) +
  geom_point(size = 1.5) +
  theme_bw() +
  geom_abline(intercept = lm_coefs[1], slope = lm_coefs[2], size = 1)

separate_lm_fits <- soilN_biomass %>%
  group_by(field) %>%
  group_map(~ lm(biomass ~ soilN, data = .))

separate_lm_coefs <- data.frame(field = c('a', 'b', 'c', 'd', 'e'), 
                                intercept = map_dbl(separate_lm_fits, ~ coef(.)[1]),
                                slope = map_dbl(separate_lm_fits, ~ coef(.)[2]))

separate_lm_coefs

ggplot(soilN_biomass, aes(x = soilN, y = biomass, color = field)) +
  geom_point(size = 1.5) +
  theme_bw() +
  geom_abline(aes(intercept = intercept, slope = slope, color = field), size = 1, data = separate_lm_coefs)

mm_fit <- lmer(biomass ~ soilN + (1 | field), data = soilN_biomass)

pred_grid <- expand.grid(soilN = c(0, 10), field = letters[1:5])
mm_pred_group <- cbind(pred_grid, biomass = predict(mm_fit, newdata = pred_grid))
mm_pred_population <- data.frame(soilN = c(0, 10), biomass = predict(mm_fit, newdata = data.frame(soilN = c(0, 10)), re.form = ~ 0))

ggplot(soilN_biomass, aes(x = soilN, y = biomass, color = field)) +
  geom_point(size = 1.5) +
  theme_bw() +
  geom_line(data = mm_pred_group) +
  geom_line(data = mm_pred_population, color = 'black', size = 1)

mm_fit_randomslopes <- lmer(biomass ~ soilN + (soilN | field), data = soilN_biomass)

mm_pred_group_randomslopes <- cbind(pred_grid, biomass = predict(mm_fit_randomslopes, newdata = pred_grid))
mm_pred_population_randomslopes <- data.frame(soilN = c(0, 10), biomass = predict(mm_fit_randomslopes, newdata = data.frame(soilN = c(0, 10)), re.form = ~ 0))

ggplot(soilN_biomass, aes(x = soilN, y = biomass, color = field)) +
  geom_point(size = 1.5) +
  theme_bw() +
  geom_line(data = mm_pred_group_randomslopes) +
  geom_line(data = mm_pred_population_randomslopes, color = 'black', size = 1)

check_model(mm_fit_randomslopes)

summary(mm_fit_randomslopes)

ranef(mm_fit_randomslopes)
fixef(mm_fit_randomslopes)
coef(mm_fit_randomslopes)

anova(mm_fit_randomslopes)

fert_biomass <- read_csv('datasets/fertilizer_biomass.csv') %>%
  mutate(treatment = factor(treatment, levels = c('control', 'low', 'high')))

ggplot(fert_biomass, aes(x = field, fill = treatment, y = biomass)) +
  geom_boxplot() + theme_bw()

fert_mm <- lmer(biomass ~ treatment + (1 | field), data = fert_biomass)

summary(fert_mm)

fert_mm_slopes <- lmer(biomass ~ treatment + (treatment | field), data = fert_biomass)

ranef(fert_mm_slopes)

VarCorr(fert_mm_slopes)

## fish_fillets %>%
##   group_by(species) %>%
##   summarize(hardness = mean(hardness, na.rm = TRUE),
##             thickness = mean(thickness, na.rm = TRUE))

## fit <- lmer(thickness ~ species + (1|fishID), data = fish_fillets)
## check_model(fit)
## summary(fit)
## anova(fit)

## fit <- lmer(thickness ~ hardness + (1|fishID), data = fish_fillets)
## check_model(fit)
## summary(fit)
## anova(fit)

## fit <- lmer(thickness ~ species + prep + species:prep + (1|fishID), data = fish_fillets)
## check_model(fit)
## summary(fit)
## anova(fit)
