# Regression Template

# Importing the dataset
dataset = read.csv('Data.csv')
dataset = dataset[2:3]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set  = subset(dataset, split == TRUE)
test_set = subset(dataset,split == FALSE)


# # Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting the Regression Model to the dataset
# Create your Regression here


# Prediction a new Result
y_pred = predict(regressor, data.frame(Level = 6.5))


# Visualising the Regression Model Results (for higher resolution and smother cureve)
# libraary(ggplot2)
x_grid = seq(min(dataset$Level),max(dataset$Level),0.1)
ggplot() +
  geom_point(aes(x = dataset$Level , y =dataset$Salary),
             color = 'red') +
  geom_line(aes(x = x_grid, y=predict(regressor,newdata = data.frame(Level = x_grid))),
            color = 'blue') +
  ggtitle('Truth Or Bluff(Regression Model)')+
  xlab('Level') +
  ylab('Salary')

