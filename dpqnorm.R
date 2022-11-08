# figure depicting rnorm, dnorm, pnorm, qnorm

library(ggplot2)
theme_set(theme_classic())
windowsFonts(`consolas` = windowsFont("Consolas"))


ggplot() +
  stat_function(fun = dnorm, xlim = c(-4, 4)) +
  scale_x_continuous(breaks = -3:3) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.1))) +
  coord_cartesian(xlim = c(-3, 3)) +
  geom_point(aes(x = 0, y = dnorm(0)), color = 'indianred', size = 3) +
  geom_segment(aes(x = 0, xend = 0, y = 0, yend = dnorm(0)), color = 'indianred', linetype = 'dashed') +
  geom_segment(aes(x = -Inf, xend = 0, y = dnorm(0), yend = dnorm(0)), color = 'indianred', linetype = 'dashed') +
  geom_text(aes(x = 0, y = 0.4), label = 'dnorm(0) = 0.399', family = 'consolas', vjust = -1, size = 6) 
  

ggplot() +
  stat_function(fun = dnorm, xlim = c(-4, 4)) +
  scale_x_continuous(breaks = -3:3) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.1))) +
  coord_cartesian(xlim = c(-3, 3)) +
  stat_function(geom = 'area', xlim = c(-4, 0), fun = dnorm, fill = 'slateblue') +
  geom_text(aes(x = 0, y = 0.4), label = 'pnorm(0) = 0.5', family = 'consolas', vjust = -1, size = 6) +
  geom_text(aes(x = 0.1, y = 0.05), label = 'qnorm(0.5) = 0', family = 'consolas', hjust = 0, size = 6)
