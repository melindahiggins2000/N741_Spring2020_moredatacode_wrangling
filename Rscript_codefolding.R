# Load Packages ----
library(readr)
library(tibble)
library(dplyr)
library(ggplot2)

# Import data ----
# import abalone.csv dataset
# use read_csv() function from readr to import data
abalone <- read_csv(file = "abalone.csv")

# Descriptive data ----
# descriptive stats for selected variables
abalone %>% 
  select(length, diameter, height) %>% 
  summary()

# save stats
stats1 <- abalone %>% 
  select(length, diameter, height) %>% 
  summary()
stats1

# specific stats
stats2 <- abalone %>%
  select(length, diameter, height) %>%
  summarise_all(list(min = min, 
                     max = max, 
                     mean = mean, 
                     sd = sd), na.rm=TRUE)

# print out transpose
t(stats2)

# stats by group
# note - this does not work with summary()
stats3 <- abalone %>%
  select(sex, wholeWeight, shuckedWeight) %>%
  group_by(sex) %>%
  summarise_all(list(min = min, 
                     max = max, 
                     mean = mean, 
                     sd = sd), na.rm=TRUE)
t(stats3)

