library(tidyverse)
library(easystats)
library(emmeans)
library(multcomp)

# Model to compare slopes across fields
soilN_biomass <- read_csv('datasets/soilN_biomass.csv')

mod <- lm(biomass ~ soilN + field + soilN:field, data = soilN_biomass)

# Estimated marginal trends of biomass versus soilN for each field (i.e., slopes)
field_trends <- emtrends(mod, ~ field, var = 'soilN')

# Individual contrasts with multiple comparison adjusted p-values
trend_contrasts <- contrast(field_trends, 'pairwise', adjust = 'sidak')
confint(trend_contrasts)

# Compact letter display for slopes
cld(field_trends, adjust = 'sidak', Letters = letters)
