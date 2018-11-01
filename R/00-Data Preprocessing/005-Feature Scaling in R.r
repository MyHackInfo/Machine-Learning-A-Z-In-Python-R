
# Importing the dataset

dataset = read.csv('Data.csv')

# Remove missing data value

dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)

dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary,FUN = function(x) mean(x,na.rm=TRUE)),
                        dataset$Salary)

# Encoding Categorical data
dataset$Country = factor(dataset$Country,
                         levels = c('France','Spain','Germany'),
                         labels = c(1,2,3))

dataset$Purchased = factor(dataset$Purchased,
                           levels = c('No','Yes'),
                           labels = c(0,1))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRation = 0.98)
training_set  = subset(dataset, split == TRUE)
test_set = subset(dataset,split == FALSE)


# Feature Scaling
#training_set = scale(training_set)
#test_set = scale(test_set)
# This code give error like : 'x' must be numeric 
# becaue country and purchased are categorical value
# so we use only age and salary
training_set[,2:3]= scale(training_set[,2:3])
test_set[,2:3]= scale(test_set[,2:3])
