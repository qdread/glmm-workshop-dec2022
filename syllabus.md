---
title: Course Syllabus
---

**This is a DRAFT and is still subject to change!**

[Skip down to course schedule](#schedule)

## Conceptual learning objectives

At the end of the workshop, students will be able to . . . 

-	Conceptually understand all components of a generalized linear mixed model (GLMM), including: 
  +	Link function
  +	Fixed effects
  +	Random intercepts and random slopes
  +	Estimated marginal means
  +	Confidence/credible intervals and prediction intervals
-	Interpret the output of a GLMM
-	Conceptually understand at least the basics of Bayesian inference

## Practical learning objectives

At the end of the workshop, students will be able to . . .

- Set up a reproducible R stats/data science workflow using RStudio projects and RMarkdown notebooks
- Use an R modeling package of their choice to fit GLMM models
  +	Frequentist/classical statistics: **lme4**
  +	Bayesian statistics: **brms**
-	Generate predictions from a fitted model, including estimated marginal means
-	Test specific hypotheses with contrasts
-	Make a nice-looking report with results in graphical, table, and text format

## R packages we will learn about

-	“tidyverse” packages especially **readr**, **dplyr**, and **tidyr** (read and manipulate data)
-	**lme4** (fit models if using classical frequentist stats)
-	**brms**/**tidybayes** (fit models if using Bayesian stats)
-	**emmeans** (estimate treatment effects and test hypotheses)
-	**ggplot2** (make publication-quality graphics)
-	**gt** (make publication-quality tables)

## Before class, you will need to ...

-	Have access to a working version of R and RStudio on a laptop
-	Preferably install the packages (specific instructions coming soon)
-	Optional: bring a dataset you are interested in analyzing. If you don’t have one, I will provide you with an example dataset.

## Note on Bayesian versus classical statistics

In this workshop, we will have it both ways. I will present both Bayesian and frequentist (classical approach) code alternatives for each model we fit. However, I will focus more on the frequentist approach in this workshop because it is what people are familiar with and I do not want to bite off more than we can chew in this first workshop. I am planning a future workshop to delve more into the finer points of the Bayesian approach.

## Schedule

This is a preliminary schedule that’s subject to change. The instructor (Quentin) will be available to answer individual questions for at least part of the long breaks.

*All times are in Eastern Standard Time.*

### DAY 1: Thursday, December 8

Time                      | Activity
------------------------- | ----------------------------------------------------------
9:00-9:15 AM              | Introductions, troubleshooting
9:15-10:15 AM             | Quick R refresher
10:15-10:45 AM            | *break*
10:45-11:30 AM            | What are LMMs? Fit our first LMM!
11:30-11:45 AM            | *break*
11:45 AM-12:30 PM         | Estimating and comparing treatment means
12:30-1:30 PM             | *lunch break*
1:30 PM-4:00 PM           | Office Hours: Students will work on data and code. Quentin will answer questions and troubleshoot.

### DAY 2: Friday, December 9

Time                      | Activity
------------------------- | ----------------------------------------------------------
9:00-9:15 AM              | Recap of Day 1
9:15-10:15 AM             | Making nice plots and tables
10:15-10:45 AM            | *break*
10:45-11:30 AM            | Putting the "generalized" into generalized linear mixed model
11:30-11:45 AM            | *break*
11:45 AM-12:30 PM         | Fun with categorical and continuous interactions
12:30-1:30 PM             | *lunch break*
1:30 PM-4:00 PM           | Office Hours: Students will work on data and code. Quentin will answer questions and troubleshoot.