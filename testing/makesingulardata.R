# attempt to engineer a dataset that will return a good fit for random intercepts but a singular fit for random slopes

#### Categorical except that we have three levels, unfertilized, low, and high.
set.seed(11212)
n_fields <- 5
plots_per_trt <- 10
n_trts <- 3
intercepts <- rep(c(10, 15, 20, 15, 30), each = plots_per_trt * n_trts)
slopes <- rep(rep(c(4, 2, 0), each = plots_per_trt), n_fields)
treatments <- rep(rep(c('high', 'low', 'control'), each = plots_per_trt), n_fields)

fakedat2 <- data.frame(field = rep(letters[6:10], each = plots_per_trt * n_trts), treatment = treatments,
                       biomass = intercepts + slopes + rnorm(n_fields * plots_per_trt * n_trts, mean = 0, sd = 1))

write_csv(fakedat2, 'datasets/fertilizer_biomass.csv')

m1 <- lmer(biomass~treatment+(1|field),data=fakedat2)
ranef(m1)
m2 <- lmer(biomass~treatment+(treatment|field),data=fakedat2)
ranef(m2)
VarCorr(m2)


data(sleepstudy)
set.seed(123)
sleepstudy$mygrp <- sample(1:5, size = 180, replace = TRUE)
sleepstudy$mysubgrp <- NA
for (i in 1:5) {
  filter_group <- sleepstudy$mygrp == i
  sleepstudy$mysubgrp[filter_group] <-
    sample(1:30, size = sum(filter_group), replace = TRUE)
}

model <- lmer(
  Reaction ~ Days + (1 | mygrp / mysubgrp) + (1 | Subject),
  data = sleepstudy
)

check_singularity(model)
