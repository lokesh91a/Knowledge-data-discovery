## Exercise 9.7.5
## Lokesh Agrawal
## Summer 2017

## Loading libraries
library(MASS)
library(ISLR)
library(class)
library(boot)
library(leaps)
print("The libraries have been loaded")

# We have seen that we can fit an SVM with a non-linear kernel in order
# to perform classification using a non-linear decision boundary. We will
# now see that we can also obtain a non-linear decision boundary by
# performing logistic regression using non-linear transformations of the
# features.
# (a) Generate a data set with n = 500 and p = 2, such that the obser-
# vations belong to two classes with a quadratic decision boundary
# between them. For instance, you can do this as follows:
# > x1 = runif (500) -0.5
# > x2 = runif (500) -0.5
# > y =1*( x1 ^2 - x2 ^2 > 0)



# (b) Plot the observations, colored according to their class labels.
# Your plot should display X 1 on the x-axis, and X 2 on the y-
# axis.



# (c) Fit a logistic regression model to the data, using X 1 and X 2 as
# predictors.



# (d) Apply this model to the training data in order to obtain a pre-
# dicted class label for each training observation. Plot the ob-
# servations, colored according to the predicted class labels. The
# decision boundary should be linear.



# (e) Now fit a logistic regression model to the data using non-linear
# functions of X 1 and X 2 as predictors (e.g. X 1 2 , X 1 ×X 2 , log(X 2 ),
# and so forth).



# (f) Apply this model to the training data in order to obtain a pre-
# dicted class label for each training observation. Plot the ob-
# servations, colored according to the predicted class labels. The
# decision boundary should be obviously non-linear. If it is not,
# then repeat (a)-(e) until you come up with an example in which
# the predicted class labels are obviously non-linear.



# (g) Fit a support vector classifier to the data with X 1 and X 2 as
# predictors. Obtain a class prediction for each training observa-
# tion. Plot the observations, colored according to the predicted
# class labels.



# (h) Fit a SVM using a non-linear kernel to the data. Obtain a class
# prediction for each training observation. Plot the observations,
# colored according to the predicted class labels.



# (i) Comment on your results.
