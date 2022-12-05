############################################################################################
#### LESSON 4: GOING FURTHER WITH MIXED MODELS                                          ####
#### =========================================                                          ####
#### This worksheet contains an incomplete version of the code presented in the lesson. ####
#### Fill in all ... with code.                                                         ####
############################################################################################
############################################################################################

library(tidyverse)
library(easystats)
library(lme4)
library(lmerTest)

maize <- read_csv('datasets/pzm_maize.csv')

glimpse(maize)

maize <- maize %>%
  mutate(
    yr = factor(yr),
    plot = factor(plot),
    block = factor(block)
  )

ggplot(maize, aes(y = yield, x = tillage, fill = cover.trt)) +
  facet_grid(location ~ yr) +
  geom_boxplot(position = position_dodge()) +
  theme_bw()

fit_maize <- lmer(yield ~ tillage + cover.trt + tillage:cover.trt + (1 | yr) + (1 | location) + (1 | block:location), data = maize)

barley_don <- read_csv('datasets/barley_don.csv')

glimpse(barley_don)

ggplot(barley_don, aes(x = Variety, y = DON_ppm, fill = Fungicide)) +
  geom_boxplot(position = position_dodge()) +
  theme_bw()

fit_don <- lmer(DON_ppm ~ Variety + Fungicide + Variety:Fungicide + (1|Rep), data = barley_don)

fit_don_log <- lmer(log(DON_ppm) ~ Variety + Fungicide + Variety:Fungicide + (1|Rep), data = barley_don)

check_model(fit_don, check = c('homogeneity', 'qq'))
check_model(fit_don_log, check = c('homogeneity', 'qq'))

## data(fisher.barley, package = 'agridat')

## bioassay <- read_csv('datasets/bioassay.csv')

## fisher.barley <- fisher.barley %>%
##   mutate(year = factor(year))

## fit_crossed <- lmer(yield ~ gen + (1|env) + (1|year), data = fisher.barley)
## fit_nested <- lmer(yield ~ gen + (1|env) + (1|year:env), data = fisher.barley)

## fit <- lmer(biomass ~ treatment + (1|experiment), data = bioassay)

## check_model(fit)

## fit_log <- lmer(log(biomass) ~ treatment + (1|experiment), data = bioassay)
## check_model(fit_log)
