############################################################################################
#### LESSON 5: GENERALIZED LINEAR MIXED MODELS                                          ####
#### =========================================                                          ####
#### This worksheet contains an incomplete version of the code presented in the lesson. ####
#### Fill in all ... with code.                                                         ####
############################################################################################
############################################################################################

library(tidyverse)
library(lme4)
library(easystats)

disease <- read_csv('datasets/disease.csv')

disease %>%
  group_by(...) %>%
  summarize(no_disease = ..., disease = ...)

lmm_disease <- lmer(..., data = disease)

check_model(...)

ggplot(data.frame(p = 0:1), aes(x=p)) +
  stat_function(fun = qlogis, color = 'slateblue', linewidth = 1) + 
  labs(y = 'logit(p)') + ylim(-5, 5) +
  theme_bw()

glmm_disease <- ...(..., data = disease, family = ...)

check_model(...)

summary(...)

...(1.39)

...(1.39 - 3.37)

data('stirret.borers', package = 'agridat')

## stirret.borers <- read_csv('datasets/stirret.borers.csv')

borer_means <- stirret.borers %>%
  ...(...) %>%
  summarize(count2_mean = ...)

ggplot(stirret.borers, aes(x = count2)) +
  geom_histogram(bins = 10) +
  geom_vline(aes(xintercept = count2_mean), data = borer_means, color = 'red') +
  facet_wrap(~ trt) +
  theme_bw()

stirret.borers <- ...
  ...(trt = ...(trt, ... = c('None', 'Early', 'Late', 'Both')))

lmm_borers <- ...(...elt(), data = stirret.borers)

glmm_borers <- ...(..., data = stirret.borers, family = ...)

check_model(lmm_borers)

check_model(glmm_borers)

summary(glmm_borers)

...(3.42)

...(3.42 - 0.24)

# Exercises ---------------------------------------------------------------

# Load data for Exercises 1 and 2

data('jansen.apple', package = 'agridat')
## jansen.apple <- read_csv('datasets/jansen.apple.csv')

jansen.apple <- jansen.apple %>%
  mutate(inoculum = factor(inoculum))

# Load data for Exercises 3 and 4

data('beall.webworms', package = 'agridat')
## beall.webworms <- read_csv('datasets/beall.webworms.csv')

