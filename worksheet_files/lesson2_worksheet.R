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

...length(dat, n = 50)

dat[...]

dat[..., c(..., 'sex')]

dat$...

...(dat$siteName)

...(dat$...)

filter(...)

select(...)

x <- c(5.3, 12.2, -8.6)

x

max(x)

x[2] <- NA

x

max(x)

max(x, na.rm = TRUE)

dat %>%
  summarize(mean_weight = mean(weight), 
            sd_weight = sd(weight))

dat %>%
  filter(!is.na(weight)) %>%
  summarize(mean_weight = mean(weight), 
            sd_weight = sd(weight))

dat %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE), 
            sd_weight = sd(weight, na.rm = TRUE))

dat %>%
  filter(!is.na(weight)) %>%
  group_by(taxonID) %>%
  summarize(mean_weight = mean(weight), 
            sd_weight = sd(weight))

dat %>%
  filter(!is.na(weight), taxonID == 'PELE') %>%
  group_by(sex, lifeStage) %>%
  summarize(n_individuals = n(),
            mean_weight = mean(weight), 
            sd_weight = sd(weight))

dat %>%
  filter(!is.na(weight), taxonID == 'PELE') %>%
  mutate(weight_mg = weight * 1000) %>%
  group_by(siteName) %>%
  summarize(mean_weight = mean(weight_mg)) %>%
  arrange(mean_weight)

table2_tidied <- ...(table2, ... = c(country, year), names_from = ..., values_from = ...)

all.equal(table2_tidied, table1)

billboard

...(billboard, cols = ..., ... = 'week', ... = 'ranking')

pivot_longer(billboard, cols = ..., names_to = 'week', values_to = 'ranking')
