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


### Barnyard GHG
barnyard_ghg <- read_csv('https://data.nal.usda.gov/system/files/BYD_GHG.csv')
