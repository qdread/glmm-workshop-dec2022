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
  group_by(inoc, pen) %>%
  summarize(no_disease = sum(disease == 0), disease = sum(disease == 1))

lmm_disease <- lmer(disease ~ inoc + (1|pen), data = disease)

check_model(lmm_disease)

ggplot(data.frame(p = 0:1), aes(x=p)) +
  stat_function(fun = qlogis, color = 'slateblue', linewidth = 1) + 
  labs(y = 'logit(p)') + ylim(-5, 5) +
  theme_bw()

glmm_disease <- glmer(disease ~ inoc + (1|pen), data = disease, family = binomial(link = 'logit'))

check_model(glmm_disease)

summary(glmm_disease)

plogis(1.39)

plogis(1.39 - 3.37)

data('stirret.borers', package = 'agridat')

## stirret.borers <- read_csv('datasets/stirret.borers.csv')

borer_means <- stirret.borers %>%
  group_by(trt) %>%
  summarize(count2_mean = mean(count2))

ggplot(stirret.borers, aes(x = count2)) +
  geom_histogram(bins = 10) +
  geom_vline(aes(xintercept = count2_mean), data = borer_means, color = 'red') +
  facet_wrap(~ trt) +
  theme_bw()

stirret.borers <- stirret.borers %>%
  mutate(trt = factor(trt, levels = c('None', 'Early', 'Late', 'Both')))

lmm_borers <- lmer(count2 ~ trt + (1|block), data = stirret.borers)

glmm_borers <- glmer(count2 ~ trt + (1|block), data = stirret.borers, family = poisson)

check_model(lmm_borers)

check_model(glmm_borers)

summary(glmm_borers)

exp(3.42)

exp(3.42 - 0.24)

## jansen.apple <- jansen.apple %>%
##   mutate(inoculum = factor(inoculum))

## # By inoculum level
## jansen.apple %>% group_by(inoculum) %>% summarize(infected = mean(y))
## # By genotype
## jansen.apple %>% group_by(gen) %>% summarize(infected = mean(y))
## # Combination
## jansen.apple %>% group_by(inoculum, gen) %>% summarize(infected = mean(y))

## fit <- glmer(cbind(y, n - y) ~ gen + inoculum + gen:inoculum + (1|block), data = jansen.apple, family = binomial(link = 'logit'))
## check_model(fit)
## summary(fit)

## fit <- glmer(y ~ spray + lead + spray:lead + (1|block), data = beall.webworms, family = poisson(link = 'log'))
## check_model(fit)
## summary(fit)

## fit_nb <- glmer.nb(y ~ spray + lead + spray:lead + (1|block), data = beall.webworms)
## check_model(fit_nb)
## summary(fit_nb)
