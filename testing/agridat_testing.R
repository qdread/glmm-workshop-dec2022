# Agridat testing for GLMMs

library(lmerTest)
library(agridat)

data(hughes.grapes)

# Piepho considers block to be a fixed effect "blocks are not a random sample in designed experiments"
glm1 <- glmer(cbind(diseased, total - diseased) ~ trt + (1|block) + (1|trt:block) + (1|vine:trt:block), data = hughes.grapes, family = binomial)

data(jansen.strawberry) # Not ideal

# Count data. Let's just use count2
data(stirret.borers)

notglm2 <- lmer(count2 ~ trt + (1|block), data = stirret.borers)

glm2 <- glmer(count2 ~ trt + (1|block), data = stirret.borers, family = poisson)

# Data that have multiple random effects 

data(besag.beans, package = 'agridat')
library(lmerTest)
library(easystats)

m1 <- lmer(yield ~ gen + (1|row) + (1|col), data = besag.beans)

check_model(m1)

# Data requiring a transformation