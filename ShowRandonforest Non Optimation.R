library(dplyr)
data_train <- read.csv("https://raw.githubusercontent.com/guru99-edu/R-Programming/master/train.csv")
glimpse(data_train)

data_test <- read.csv("https://raw.githubusercontent.com/guru99-edu/R-Programming/master/test.csv")
glimpse(data_test)

library(randomForest)
library(caret)
library(e1071)