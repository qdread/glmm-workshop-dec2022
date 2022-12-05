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

...(maize)

maize <- ...
  ...(
    yr = factor(yr),
    plot = ...,
    block = ...
  )

ggplot(maize, aes(y = yield, x = tillage, fill = cover.trt)) +
  facet_grid(location ~ yr) +
  geom_boxplot(position = position_dodge()) +
  theme_bw()

fit_maize <- ...(yield ~ ... + (1 | ...) + (1 | ...) + (1 | ...), data = maize)

barley_don <- read_csv('datasets/barley_don.csv')

glimpse(barley_don)

ggplot(barley_don, aes(x = Variety, y = DON_ppm, fill = Fungicide)) +
  geom_boxplot(position = position_dodge()) +
  theme_bw()

fit_don <- ...(... + (1|Rep), data = barley_don)

fit_don_log <- lmer(... ~ ..., data = barley_don)

...(..., check = c('homogeneity', 'qq'))
...(..., check = c('homogeneity', 'qq'))


# Exercises ---------------------------------------------------------------

# Load data for Exercises 1 and 2

data(fisher.barley, package = 'agridat')
## fisher.barley <- read_csv('datasets/fisher.barley.csv')

# Load data for Exercises 3 and 4

bioassay <- read_csv('datasets/bioassay.csv')
