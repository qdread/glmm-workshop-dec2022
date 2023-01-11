############################################################################################
#### LESSON 2: WORKING WITH DATA FRAMES                                                 ####
#### ==================================                                                 ####
#### This worksheet contains an incomplete version of the code presented in the lesson. ####
#### Fill in all ... with code.                                                         ####
############################################################################################
############################################################################################

...(tidyverse)

dat <- ...('datasets/small_mammals.csv')

dat

...(dat, n = 50)

dat[...]

dat[..., c(..., 'sex')]

dat$...

...(dat$siteName)

...(dat$...)

filter(...)

select(...)

x <- c(5.3, 12.2, -8.6)

max(x)

x[2] <- ...

max(x)

max(x, ... = TRUE)

...
  ...(mean_weight = mean(weight), 
            sd_weight = sd(weight))

dat %>%
  ...(!...(weight)) %>%
  summarize(mean_weight = mean(weight), 
            sd_weight = sd(weight))

dat %>%
  summarize(mean_weight = mean(weight, ...), 
            sd_weight = sd(weight, ...))

dat %>%
  filter(...) %>%
  ...(taxonID) %>%
  summarize(mean_weight = mean(weight), 
            sd_weight = sd(weight))

dat %>%
  filter(...(weight), ... 'PELE') %>%
  group_by(...) %>%
  ...(n_individuals = ...,
            mean_weight = mean(weight), 
            sd_weight = sd(weight))

dat %>%
  filter(!is.na(weight), taxonID == 'PELE') %>%
  ...(weight_mg = ...) %>%
  ...(siteName) %>%
  summarize(mean_weight = mean(weight_mg)) %>%
  ...(mean_weight)

table2_tidied <- ...(table2, ... = c(..., year), names_from = ..., values_from = ...)

all.equal(table2_tidied, table1)

billboard

...(billboard, cols = ..., ... = 'week', ... = 'ranking')

pivot_longer(billboard, cols = ..., names_to = 'week', values_to = 'ranking')
