# Preprocessing of example datasets

# NEON mammal data
library(tidyverse)
neon_mamm <- read_csv('C:/Users/qdread/onedrive_usda/training/ARS_stats_workshop_Dec2022/example_datasets/final_NEON_mammal_data.csv')

neon_mamm_example <- neon_mamm %>%
  filter(siteID %in% c('HARV', 'KONZ', 'SCBI', 'ORNL'), !grepl('SP$', taxonID)) %>%
  select(siteName, taxonID, family, sex, lifeStage, hindfootLength, weight)

write_csv(neon_mamm_example, 'datasets/small_mammals.csv')

# PZM dataset
# Found from ag data commons at https://data.nal.usda.gov/dataset/regionally-adapted-implementation-conservation-agriculture-delivers-rapid-improvements-soil-properties-associated-crop-yield-stability
library(tidyverse)
library(readxl)

pzm <- read_xlsx('C:/Users/qdread/onedrive_usda/training/ARS_stats_workshop_Dec2022/example_datasets/PZM_yields_stability_soil.xlsx', sheet = 1)
# I think this actually does not require that much preprocessing.

pzm_maize <- pzm %>% filter(crop == 'm')
write_csv(pzm_maize, 'datasets/pzm_maize.csv')

### Barnyard GHG
barnyard_ghg <- read_csv('https://data.nal.usda.gov/system/files/BYD_GHG.csv')

### Generate simple simulated data for lesson 3
### Overall analysis, separate linear models, random intercepts, and random slopes
### Data collected in multiple fields. In each field we have soil N and plant height

library(ggplot2)
library(lmerTest)
library(readr)

set.seed(1128)
n_fields <- 5
plots_per_field <- 20
intercepts <- rep(c(10, 15, 20, 15, 30), each = plots_per_field)
slopes <- rep(c(3, 1, 0.25, 2.5, 0.5), each = plots_per_field)

soilN <- runif(n_fields * plots_per_field, min = 0, max = 10)

fakedat <- data.frame(field = rep(letters[1:5], each = plots_per_field), soilN = soilN, 
                      biomass = intercepts + soilN * slopes + rnorm(n_fields * plots_per_field, mean = 0, sd = 3))


ggplot(fakedat, aes(x=soilN, y = biomass, color = field, group = field)) + geom_point(size=1.5) + geom_smooth(method='lm')

lm1 <- lm(biomass ~ soilN, data = fakedat)
summary(lm1)
anova(lm1)
lmm_ri <- lmer(biomass ~ soilN + (1 | field), data = fakedat)
lmm_rs <- lmer(biomass ~ soilN + (0 + soilN | field), data = fakedat)
lmm_ris <- lmer(biomass ~ soilN + (1 + soilN | field), data = fakedat)

summary(lmm_ri)
summary(lmm_rs)
summary(lmm_ris)

anova(lmm_ri)
anova(lmm_rs)
anova(lmm_ris)

write_csv(fakedat, 'datasets/soilN_biomass.csv')

### Also do the same with categorical.
# Now we have five fields where we have plots that were randomized to get N fertilizer. The effect of N fertilizer addition is the fixed effect

set.seed(1121)
n_fields <- 5
plots_per_field <- 20
intercepts <- rep(c(10, 15, 20, 15, 30), each = plots_per_field)
slopes <- rep(c(2.5, 0, 2.5, 0, 2.5, 0, 2.5, 0, 2.5, 0), each = plots_per_field/2)
treatments <- rep(c('fertilized', 'control'), each = plots_per_field/2)

fakedat2 <- data.frame(field = rep(letters[6:10], each = plots_per_field), treatment = treatments,
                       biomass = intercepts + slopes + rnorm(n_fields * plots_per_field, mean = 0, sd = 3))

ggplot(fakedat2, aes(x=treatment, y = biomass, group = field, color = field)) + geom_point(position = position_dodge(width = .3)) +
  stat_summary(fun = median, geom = 'point', size = 2, shape = 2, position = position_dodge(width = .3)) +
  stat_summary(fun = median, geom = 'line', position = position_dodge(width = .3))

lm1 <- lm(biomass ~ treatment, data = fakedat2)
summary(lm1)
anova(lm1)
lmm_ri <- lmer(biomass ~ treatment + (1 | field), data = fakedat2)
lmm_rs <- lmer(biomass ~ treatment + (0 + soilN | field), data = fakedat2)
lmm_ris <- lmer(biomass ~ treatment + (1 + soilN | field), data = fakedat2)

summary(lmm_ri)
summary(lmm_rs)
summary(lmm_ris)

anova(lmm_ri)
anova(lmm_rs)
anova(lmm_ris)


### Non-normal data: Logan's DON data

DON <- read_excel("C:/Users/qdread/onedrive_usda/ars_projects/cowger_clark/DONallyears.xlsx") 

# Just use one year
DON2021 <- DON %>% filter(Year %in% c(2021), Timing == 'Medium') %>%
  rename(weight_kg = `Wght (kg)`, mean_index = `Mean IND`, DON_ppm = `DON (ppm)`, PIK = `PIK%`, yield_bu_ac = `Yield (bu/ac)`) %>%
  select(-c(`Trtmt #`, Timing, Year, logDON, TW, mean_index, logIND)) %>%
  mutate(Rep = factor(Rep, labels = LETTERS[1:4]))



fit_don <- lmer(DON_ppm ~ Variety + Fungicide + Variety:Fungicide + (1|Rep), data = DON2021)
fit_don_log <- lmer(log(DON_ppm) ~ Variety + Fungicide + Variety:Fungicide + (1|Rep), data = DON2021)

check_model(fit_don, check = 'qq')
check_model(fit_don_log, check = 'qq')

write_csv(DON2021, 'datasets/barley_don.csv')
