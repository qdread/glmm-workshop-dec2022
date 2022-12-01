# Stirret borers distribution plots

library(ggh4x)

ggplot(stirret.borers, aes(x = count2, y = stat(density))) + geom_histogram(bins = 10) +
  stat_theodensity(distri = 'norm', color = "#E69F00") +
  stat_theodensity(distri = 'pois', color = "#56B4E9")
