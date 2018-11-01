# Decision Tree Regressor

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Fitting the Decision Tree Regressor to the dataset
install.packages('rpart')
library(rpart)
regressor = rpart(formula = Salary ~ .,
                data = dataset ,
                control = rpart.control(minsplit = 1))


# Prediction a new Result
y_pred = predict(regressor, data.frame(Level = 6.5))


# Visualising the Decision Tree Regressor Results
# libraray(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level,y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level,y = predict(regressor,newdata = dataset)),
            colour ='blue')+
  ggtitle('Truth or Bluff(Decision Tree Regression)') +
  xlab('Level')+
  ylab('Salary')


# Visualising the SVR Results (for higher resolution and smother cureve)
# libraary(ggplot2)
x_grid = seq(min(dataset$Level),max(dataset$Level),0.1)
ggplot() +
  geom_point(aes(x = dataset$Level , y =dataset$Salary),
             color = 'red') +
  geom_line(aes(x = x_grid, y=predict(regressor,newdata = data.frame(Level = x_grid))),
            color = 'blue') +
  ggtitle('Truth Or Bluff(SVR)')+
  xlab('Level') +
  ylab('Salary')


install.packages('tm')
