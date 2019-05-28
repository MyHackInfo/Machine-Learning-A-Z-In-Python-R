# Simple_Linear Regression 

# Importing the Librarires
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import pickle
# How to Importing the dataset 
dataset = pd.read_csv('SalaryData.csv')
X = dataset.iloc[:,:-1].values
y = dataset.iloc[:,1].values


# Splitting the dataset into the Training set and Test set
from sklearn.cross_validation import train_test_split
X_train, X_test, y_train , y_test = train_test_split(X,y ,test_size = 1/3 ,random_state=0)


# In Simple linear regression no need feature Scaling
# Feature Scaling
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)"""


# Fitting Simple Linear Regression to the Training set
from sklearn.linear_model import LinearRegression
regressor = LinearRegression()
regressor.fit(X_train,y_train)

'''
# Use pickle for object store
# Here i use pickle for store model object data in file for not train again and again.
with open('linearregression.pickle','wb') as f:
    pickle.dump(regressor, f)

pickle_get_data = open('linearregression.pickle','rb')
regressor = pickle.load(pickle_get_data)
'''

# Get The Accuracy Score with cross_validation train_test_split models
accuracy = regressor.score(X_test,y_test)
print("Accuracy: ",accuracy)

# Predicting the Test set Results
y_pred = regressor.predict(X)



#Now that the model is trained, let’s evaluate it on the training set:
#Let’s measure this regression model’s RMSE on the whole training set using Scikit-Learn’s mean_squared_error function:
from sklearn.metrics import mean_squared_error
line_mse = mean_squared_error(y,y_pred)
line_rmse = np.sqrt(line_mse)
print(line_rmse)

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
# Visualising the Training set results
plt.scatter(X_train, y_train, color = 'red')
plt.plot(X_train, regressor.predict(X_train),color='blue')
plt.title("Salary VS Experience (Training set)")
plt.xlabel('Years of Experience')
plt.ylabel('Salary')
plt.show()


# Visualising the Test set results
plt.scatter(X_test, y_test, color = 'red')
plt.plot(X_train, regressor.predict(X_train),color='blue')
plt.title("Salary VS Experience (Test set)")
plt.xlabel('Years of Experience')
plt.ylabel('Salary')
plt.show()
'''
