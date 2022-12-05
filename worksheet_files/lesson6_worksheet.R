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

fert_mm <- lmer(biomass ~ treatment + (1 | field), data = fert_biomass)

theme_set(theme_bw())

fert_emm <- emmeans(fert_mm, ~ treatment)

fert_emm

plot(fert_emm)

contrast(fert_emm, method = 'pairwise')

contr_bonferroni <- contrast(fert_emm, method = 'pairwise', adjust = 'sidak')

contr_bonferroni

plot(contr_bonferroni)

plot(contr_bonferroni) + geom_vline(xintercept = 0, linetype = 'dashed', linewidth = 1)

cld(fert_emm, adjust = 'sidak')

cld(fert_emm, adjust = 'sidak', Letters = letters)

contrast(fert_emm, method = 'trt.vs.ctrl')

data('stirret.borers', package = 'agridat')

stirret.borers <- stirret.borers %>%
  mutate(trt = factor(trt, levels = c('None', 'Early', 'Late', 'Both')))

glmm_borers <- glmer(count2 ~ trt + (1|block), data = stirret.borers, family = poisson)

emmeans(glmm_borers, ~ trt)

emm_borers <- emmeans(glmm_borers, ~ trt, type = 'response')

emm_borers

contrast(emm_borers, method = 'pairwise', adjust = 'sidak')

fish_fillets <- read_csv('datasets/fish_fillets.csv')
fit_fillets <- lmer(thickness ~ species + prep + species:prep + (1|fishID), data = fish_fillets)

emm_species <- emmeans(fit_fillets, ~ species)
emm_prep <- emmeans(fit_fillets, ~ prep)

emm_species
emm_prep

emm_species_x_prep <- emmeans(fit_fillets, ~ species + prep)

emm_species_x_prep

cld(emm_species_x_prep, adjust = 'sidak', Letters = letters)

emm_prep_within_species <- emmeans(fit_fillets, ~ prep | species)

cld(emm_prep_within_species, adjust = 'sidak', Letters = letters)

## data(jansen.apple, package = 'agridat')
## jansen.apple <- jansen.apple %>%
##   mutate(inoculum = factor(inoculum))
## fit_apples <- glmer(cbind(y, n - y) ~ gen + inoculum + gen:inoculum + (1|block), data = jansen.apple, family = binomial(link = 'logit'))

## emm_inoculum <- emmeans(fit_apples, ~ inoculum, type = 'response')
## plot(emm_inoculum)
## contrast(emm_inoculum, method = 'pairwise', adjust = 'sidak')
## cld(emm_inoculum, adjust = 'sidak', Letters = letters)

## emm_genotype <- emmeans(fit_apples, ~ gen, type = 'response')
## plot(emm_genotype)
## contrast(emm_genotype, method = 'pairwise', adjust = 'sidak')
## cld(emm_genotype, adjust = 'sidak', Letters = letters)

## emm_inoc_within_genotype <- emmeans(fit_apples, ~ inoculum | gen, type = 'response')
## cld(emm_inoc_within_genotype, adjust = 'sidak', Letters = letters)
