## More detailed answer on nested vs crossed random effects, and interactions between random effects

Here is an example that may clarify things. Let's say we have 3 locations and 2 years in a study, both of which are treated as random, and a single fixed treatment effect. We have the following possibilities of random effects that we can fit:

1. Random intercept for each location (3)
2. Random intercept for each year (2)
3. Random intercept for each combination of location and year (3*2 = 6)
4. Random treatment effect (i.e., slope) for each location (3)
5. Random slope for each year (2)
6. Random slope for each combination of location and year (3*2 = 6)

We might want to model the situation where location has an effect on the intercept and year has an effect on the intercept, and these effects are completely additive (location effects are consistent across years and vice versa). Because we are only considering effects on the intercept and not modeling the treatment effect differing across locations and years, we only need to fit random intercepts. So we need to include #1 and #2 from the list above. I would call that situation **crossed**. lme4 syntax for the random portion of the model formula would be `(1|location) + (1|year)`

We might want to model the situation where each location-year combination is a unique one-of-a-kind environment, and there's no consistent location effect that exists across both years, and vice versa. If we are fitting only random intercepts, that would mean #3 only from the list above. I would call that situation **nested** but I think you could also refer to it as an interaction between location and year. lme4 syntax would be `(1|location:year)` or `(1|year:location)`, which are equivalent.

We can also include 1+3, 2+3, or even 1+2+3 in the same model. That would mean there are additive effects of location and/or year (1 and 2) as well as an effect of unique location-year combinations. We could say, for example, that location has an overall effect and location-year combinations have a unique effect: lme4 syntax `(1|location) + (1|location:year)`. I would call this "years nested within locations." Conversely `(1|year) + (1|location:year)` would be termed "locations nested within years."

Now for the situation where we want to model the treatment effect differing across locations and/or years. We can add effects 4, 5, and/or 6 from the list above to the model. I would call those **random slopes**, either crossed or nested as appropriate. However you could also refer to them as "interactions" between treatment and location or year. For instance a model with crossed random intercepts and slopes for location and year would have the random effect syntax `(treatment|location) + (treatment|year)`. And so on ...

Lastly, to clarify something about SAS syntax. It is possible, in the random statment, to write either `location*year` or `location(year)`. The first one looks more like specifying an interaction between fixed effects in the model statement, and the second one is more specifically associated with nesting random effects. However they are equivalent and will result in exactly the same parameter estimates.