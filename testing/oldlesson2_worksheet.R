############################################################################################
############################################################################################
#### LESSON 2: WORKING WITH DATA FRAMES                                                 ####
#### ==================================                                                 ####
#### This worksheet contains an incomplete version of the code presented in the lesson. ####
#### Fill in all ... with code.                                                         ####
############################################################################################
############################################################################################

...(tidyverse)

dat <- ...('datasets/small_mammals.csv')

...(dat, n = 50)

dat[2, 3]

dat[5, ]

dat[, 2]

dat[6:10, ]

dat[1:5, 1:2]

dat[20, c('taxonID', 'sex')]

dat$siteName

unique(dat$siteName)

table(dat$sex)

filter(dat, weight < 10)

select(dat, taxonID, weight)

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
  group_by(siteName) %>%
  summarize(mean_weight = mean(weight)) %>%
  arrange(mean_weight)

table1
table2
table3

table2_tidied <- pivot_wider(table2, id_cols = c(country, year), names_from = type, values_from = count)

all.equal(table2_tidied, table1)

billboard

pivot_longer(billboard, cols = c(wk1:wk76), names_to = 'week', values_to = 'ranking')

pivot_longer(billboard, cols = -c(artist, track, date.entered), names_to = 'week', values_to = 'ranking')
