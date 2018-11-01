# Polynomial Regression

# Import the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# No Need Training and Test set

# Fitting Linear Regression to the dataset
lin_reg = lm(formula = Salary ~ . , 
             data = dataset)


# Fitting Polymial Regression to the dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_reg = lm(formula = Salary ~ . ,
              data = dataset)

# Visualising the Linear Regression Results
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level , y =dataset$Salary),
             color = 'red') +
  geom_line(aes(x = dataset$Level, y=predict(lin_reg,newdata = dataset)),
            color = 'blue') +
  ggtitle('Truth Or Bluff(Linear Regression)')+
  xlab('Level') +
  ylab('Salary')



# Visualising th Polynomial Regression Results

ggplot() +
  geom_point(aes(x = dataset$Level , y =dataset$Salary),
             color = 'red') +
  geom_line(aes(x = dataset$Level, y=predict(poly_reg,newdata = dataset)),
            color = 'blue') +
  ggtitle('Truth Or Bluff(Polynomial Regression)')+
  xlab('Level') +
  ylab('Salary')

# Predicting a new Result with Linear Regression
y_pred = predict(lin_reg , data.frame(Level = 6.5))

# Prediction a new Result with Polynomial Regression
y_pred2 = predict(poly_reg, data.frame(Level = 6.5,
                                       Level2 = 6.5^2,
                                       Level3 = 6.5^3,
                                       Level4 = 6.5^4))
                  

