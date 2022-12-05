############################################################################################
#### LESSON 1: R BASICS                                                                 ####
#### ==================                                                                 ####
#### This worksheet contains an incomplete version of the code presented in the lesson. ####
#### Fill in all ... with code.                                                         ####
############################################################################################
############################################################################################

# Using the R console

2 + 3

x <- 2 + 3
y = 3.5

x
y

x + y
x * 4

x <- x + 1
z <- x * 4
z

log(1000)

sin(pi)

my_name <- ...

paste('Hello,', ...)

# Types of output, errors, warnings, and notes

plot(mpg ~ hp, data = mtcars)

sin(pi))

log(-5)

rep(0, 100000)

# Function arguments

...(from = 1, ...)

1:100

c('a', 'b', 'c', 'd', 'e', 'f', 'g')

letters[1:7]

letters[c(1, 18, 19)]

log('hello')

c(100, 5.323, 'missing value', 12)

treatment <- factor(c('low', 'low', 'medium', 'medium', 'high', 'high'))

treatment

treatment <- factor(treatment, levels = c('low', 'medium', 'high'))

treatment

x <- 1:5

x > 4

x <= 2

x == 3

x != 2

x > 1 & x < 5

x <= 1 | x >= 5

!(x == 3)

c(1, 5, 6, 7) %in% x

x %in% c(1, 5, 6, 7)

set.seed(123)

random_numbers <- rnorm(n = 1000, mean = 0, sd = 1)

head(exp(random_numbers))

length(random_numbers)

mean(random_numbers)

median(random_numbers)

sd(random_numbers)

range(random_numbers)

quantile(random_numbers, probs = c(0.025, 0.5, 0.975))

(5+3))/2 # Nope

(5+3)/2 # Yep

my_variable <- 100000

myvariable

some_numbers <- 1:5

( some_numbers + 3 ) ^ 2

(some_numbers+3)^2

(some numbers + 3)^2

sum(1:10)
Sum(1:10)

...('cowsay')

...(cowsay)
say(..., by = 'cow')

...::say(..., by = 'chicken')
