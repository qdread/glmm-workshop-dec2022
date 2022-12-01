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

write_csv(fakedat2, 'datasets/fertilizer_biomass.csv')

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

#### Categorical except that we have three levels, unfertilized, low, and high.
set.seed(1121)
n_fields <- 5
plots_per_trt <- 10
n_trts <- 3
intercepts <- rep(c(10, 15, 20, 15, 30), each = plots_per_trt * n_trts)
slopes <- rep(rep(c(5, 2.5, 0), each = plots_per_trt), n_fields)
treatments <- rep(rep(c('high', 'low', 'control'), each = plots_per_trt), n_fields)

fakedat2 <- data.frame(field = rep(letters[6:10], each = plots_per_trt * n_trts), treatment = treatments,
                       biomass = intercepts + slopes + rnorm(n_fields * plots_per_trt * n_trts, mean = 0, sd = 1.5))

m1 <- lmer(biomass~treatment+(1|field),data=fakedat2)
ranef(m1)
m2 <- lmer(biomass~treatment+(treatment|field),data=fakedat2)
ranef(m2)

write_csv(fakedat2, 'datasets/fertilizer_biomass.csv')

ggplot(fakedat2, aes(x=treatment, y = biomass, group = field, color = field)) + geom_point(position = position_dodge(width = .3)) +
  stat_summary(fun = median, geom = 'point', size = 2, shape = 2, position = position_dodge(width = .3)) +
  stat_summary(fun = median, geom = 'line', position = position_dodge(width = .3))

### Non-normal data: Logan's DON data

DON <- read_excel("C:/Users/qdread/onedrive_usda/ars_projects/cowger_clark/DONallyears.xlsx") 

# Just use one year
DON2021 <- DON %>% filter(Year %in% c(2021), Timing == 'Medium') %>%
  rename(weight_kg = `Wght (kg)`, mean_index = `Mean IND`, DON_ppm = `DON (ppm)`, PIK = `PIK%`, yield_bu_ac = `Yield (bu/ac)`) %>%
  select(-c(`Trtmt #`, Timing, Year, logDON, TW, mean_index, logIND)) %>%
  mutate(Rep = factor(Rep, labels = LETTERS[1:4]))

#Add noise
set.seed(1239)
DON2021 <- DON2021 %>%
  mutate(weight_kg = weight_kg + rnorm(nrow(DON2021), mean = 0, sd = 0.1),
         DON_ppm = DON_ppm + rnorm(nrow(DON2021), mean = 0, sd = 0.1),
         yield_bu_ac = yield_bu_ac + rnorm(nrow(DON2021), mean = 0, sd = 1),
         PIK = PIK + rbinom(nrow(DON2021), size = 5, prob = .25))

fit_don <- lmer(DON_ppm ~ Variety + Fungicide + Variety:Fungicide + (1|Rep), data = DON2021)
fit_don_log <- lmer(log(DON_ppm) ~ Variety + Fungicide + Variety:Fungicide + (1|Rep), data = DON2021)

check_model(fit_don, check = 'qq')
check_model(fit_don_log, check = 'qq')

write_csv(DON2021, 'datasets/barley_don.csv')


### Example fake data for logistic GLMM

logistic_dat <- data.frame(pen = rep(LETTERS[1:5], each = 2),
                           inoc = c('no', 'yes'),
                           n_absent = c(0, 6, 3, 9, 4, 9, 3, 9, 1, 10),
                           n_present = c(10, 4, 7, 1, 6, 1, 7, 1, 9, 0),
                           n_total = 10)

# Individual version
logistic_long <- logistic_dat %>%
  group_by(pen, inoc) %>%
  group_modify(~ data.frame(disease = rep(c(0, 1), c(.$n_absent, .$n_present)))) %>%
  mutate(animal = 1:n()) %>%
  select(pen, animal, inoc, disease)

write_csv(logistic_long, 'datasets/disease.csv')

disease_lmm <- lmer(disease ~ inoc + (1|pen), data = logistic_long)
disease_glmm <- glmer(disease ~ inoc + (1|pen), data = logistic_long, family = binomial)


### Catfish data
library(tidyverse)
library(readxl)
library(lmerTest)

fillet_data <- read_xlsx('C:/Users/qdread/OneDrive - USDA/ars_projects/misc/Updated Sensory TPA data-2 -with graphs.xlsx', sheet = "John's data set", .name_repair = 'universal')


fillet_data_by_pos <- fillet_data %>%
  select(-starts_with('Avg')) %>% 
  pivot_longer(-c(fish.ID, location, season, prep, species, gender, fish.wt, fillet.wt)) %>%
  mutate(name = gsub('\\.', '_', name)) %>%
  separate(name, into = c('variable', 'position'), sep = '_P') %>%
  pivot_wider(id_cols = c(fish.ID, location, season, prep, species, gender, fish.wt, fillet.wt, position), names_from = 'variable', values_from = 'value') %>%
  mutate(position = factor(position))

example_fillet_data <- fillet_data_by_pos %>%
  select(fishID = fish.ID, prep, species, position, hardness = Hardness_1, thickness = Thickness_1) %>%
  filter(prep %in% c('Fresh', 'froz', 'raw')) %>%
  mutate(prep = factor(tolower(prep), labels = c('fresh', 'frozen', 'raw')))

m1 <- lmer(thickness ~ species + (1|fishID), data = example_fillet_data)
m1b <- lmer(thickness ~ species + prep + species:prep + (1|fishID), data = example_fillet_data)

channel_data <- example_fillet_data %>% filter(species == 'Channel')

m2 <- lmer(thickness ~ hardness + (1|fishID), data = channel_data)
m3 <- lmer(thickness ~ hardness + (hardness|fishID), data = channel_data)

# Add noise
set.seed(1233)
example_fillet_data <- example_fillet_data %>%
  mutate(hardness = hardness + rbinom(nrow(example_fillet_data), size = 5, prob = .5),
         thickness = thickness + rnorm(nrow(example_fillet_data), mean = 0, sd = 1))

write_csv(example_fillet_data, 'datasets/fish_fillets.csv')
