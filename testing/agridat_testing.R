# Agridat testing for GLMMs

library(lmerTest)
library(agridat)

data(hughes.grapes)

# Piepho considers block to be a fixed effect "blocks are not a random sample in designed experiments"
glm1 <- glmer(cbind(diseased, total - diseased) ~ trt + (1|block) + (1|trt:block) + (1|vine:trt:block), data = hughes.grapes, family = binomial)

data(jansen.strawberry) # Not ideal
