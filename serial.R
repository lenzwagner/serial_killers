# Data and Prep.
library(readxl)
library(tidyverse)
data = read_xlsx("/Users/lorenzwagner/Documents/data.xlsx")
data[["usa"]] <- +grepl("United States", data[["country"]])
data[["richard"]] <- +grepl("Richard", data[["given_name"]])
data$male <- ifelse(data$sex == 'male', 1, 0)
names(data)[names(data) == "victims_proven"] <- "victims"

# Regression
model = lm(victims~male+active+richard+usa, data)
summary(model)
