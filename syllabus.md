---
layout: page
title: Course Syllabus
---

**This is a DRAFT and is still subject to change! Last updated October 20.**

[Skip down to course schedule](#schedule)

## Conceptual learning objectives

At the end of the workshop, students will be able to . . . 

-	Conceptually understand all components of a linear mixed model (LMM), including: 
  +	Fixed effects
  +	Random intercepts and random slopes
  +	Estimated marginal means
  +	Confidence intervals and prediction intervals
-	Interpret the output of a LMM

## Practical learning objectives

At the end of the workshop, students will be able to . . .

- Set up an R stats pipeline using RStudio projects and RMarkdown notebooks (a pipeline that takes you from the raw data to a document presenting analysis results)
- Use the R modeling package **lme4** to fit GLMM models
-	Generate predictions from a fitted model, including estimated marginal means
-	Test specific hypotheses with contrasts
-	Make a nice-looking report with results in graphical, table, and text format

## R packages we will learn about

-	“tidyverse” packages especially **readr**, **dplyr**, and **tidyr** (read and manipulate data)
-	**lme4** (fit models)
-	**emmeans** (estimate treatment effects and test hypotheses)
-	**ggplot2** (make publication-quality graphics)
-	**gt** (make publication-quality tables)

## Before class, you will need to ...

-	Have access to a working version of R and RStudio on a laptop
-	Install the necessary packages (specific instructions coming soon)
-	Optional: bring a dataset you are interested in analyzing. If you don’t have one, I will provide you with an example dataset.

## Note on general versus generalized models, and Bayesian versus classical statistics

Based on the poll results, it seems that most students taking this course will need to spend some time learning the basics of R before we get into the statistics. Therefore I think it will not be feasible to cover generalized linear models or Bayesian statistics in this workshop. We will focus on R basics and start with simpler LMM models. I will plan a future workshop or series of workshops on generalized linear mixed models, and on Bayesian statistics.

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