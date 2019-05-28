# Decision Tree Regression

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Position_Salaries.csv')
X = dataset.iloc[:, 1:2].values
y = dataset.iloc[:, 2].values

# Splitting the dataset into the Training set and Test set
"""from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)"""

# Feature Scaling
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)
sc_y = StandardScaler()
y_train = sc_y.fit_transform(y_train)"""

# Fitting Decision Tree Regression to the dataset
from sklearn.tree import DecisionTreeRegressor
regressor = DecisionTreeRegressor(random_state = 0)
regressor.fit(X, y)

# Predicting a new result
y_pred = regressor.predict(X)

#Training and Evaluating on the Training Set:
#Let’s measure this regression model’s RMSE on the whole training set using Scikit-Learn’s mean_squared_error function:
from sklearn.metrics import mean_squared_error
tree_mse = mean_squared_error(y,y_pred)
tree_rmse = np.sqrt(tree_mse)
print(tree_rmse)


# Better Evaluation Using Cross-Validation:
    #A great alternative is to use Scikit-Learn’s cross-validation feature. The following code performs K-fold
    #cross-validation: it randomly splits the training set into 10 distinct subsets called folds, then it trains and
    #evaluates the Decision Tree model 10 times, picking a different fold for evaluation every time and
    #training on the other 9 folds. The result is an array containing the 10 evaluation scores:
from sklearn.model_selection import cross_val_score
scores = cross_val_score(regressor, X,y,scoring="neg_mean_squared_error",cv=10)
rmse_scores = np.sqrt(-scores)

def display_scores(scores):
    print("Scores:",scores)
    print("Mean:",scores.mean())
    print("Standard deviation:",scores.std())

display_scores(rmse_scores)

'''
# Visualising the Decision Tree Regression results (higher resolution)
X_grid = np.arange(min(X), max(X), 0.01)
X_grid = X_grid.reshape((len(X_grid), 1))
plt.scatter(X, y, color = 'red')
plt.plot(X_grid, regressor.predict(X_grid), color = 'blue')
plt.title('Truth or Bluff (Decision Tree Regression)')
plt.xlabel('Position level')
plt.ylabel('Salary')
plt.show()
'''
