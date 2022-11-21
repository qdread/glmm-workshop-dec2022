# Preprocessing of example datasets

# NEON mammal data
library(tidyverse)
neon_mamm <- read_csv('C:/Users/qdread/onedrive_usda/training/ARS_stats_workshop_Dec2022/example_datasets/final_NEON_mammal_data.csv')

neon_mamm_example <- neon_mamm %>%
  filter(siteID %in% c('HARV', 'KONZ', 'SCBI', 'ORNL'), !grepl('SP$', taxonID)) %>%
  select(siteName, taxonID, family, sex, lifeStage, hindfootLength, weight)

write_csv(neon_mamm_example, 'datasets/small_mammals.csv')
