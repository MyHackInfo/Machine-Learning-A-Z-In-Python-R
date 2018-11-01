# Simple Linear Regression

# Importing the dataset

dataset = read.csv('SalaryData.csv')
# dataset = dataset[,2:3]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set  = subset(dataset, split == TRUE)
test_set = subset(dataset,split == FALSE)


# # Feature Scaling
# training_set[,2:3]= scale(training_set[,2:3])
# test_set[,2:3]= scale(test_set[,2:3])

# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

# Predicting the test set results
y_pred = predict(regressor , newdata = test_set)


# Visualising the Training set results
# Visualising data use ggplot2 library 
library(ggplot2)

ggplot()+
  geom_point(aes(x=training_set$YearsExperience,y=training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience,y = predict(regressor,newdata = training_set)),
            colour='blue')+
  ggtitle("Salary VS Experinece (Training set)")+
  xlab("Year of experience")+
  ylab("salary")


# Visualising the test set results
ggplot()+
  geom_point(aes(x=test_set$YearsExperience,y=test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience,y = predict(regressor,newdata = training_set)),
            colour='blue')+
  ggtitle("Salary VS Experinece (Test set)")+
  xlab("Year of experience")+
  ylab("salary")
