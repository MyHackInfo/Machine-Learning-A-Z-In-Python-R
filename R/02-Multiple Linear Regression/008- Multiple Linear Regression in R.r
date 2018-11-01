# Multiple Linear Regression

# Importing the dataset

dataset = read.csv('50_Startups.csv')
# dataset = dataset[,2:3]

# Encoding categorical data
dataset$State = factor(dataset$State,
                       levels = c('New York','California','Florida'),
                       labels = c(1,2,3))


# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set  = subset(dataset, split == TRUE)
test_set = subset(dataset,split == FALSE)

# Fitting Multiple Linear Regression to the Training set
regressor = lm(formula = Profit ~ .,
               data = training_set)

# Predicting the Test set Results
y_pred = predict(regressor, newdata = test_set)
