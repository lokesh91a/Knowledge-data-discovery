## Exercise 8.4.8
## Lokesh Agrawal
## Summer 2017

## Loading libraries
library(MASS)
library(ISLR)
library(class)
library(boot)
library(leaps)
library(tree)
print("The libraries have been loaded")

# In the lab, a classification tree was applied to the Carseats data set af-
# ter converting Sales into a qualitative response variable. Now we will
# seek to predict Sales using regression trees and related approaches,
# treating the response as a quantitative variable.
# (a) Split the data set into a training set and a test set.

set.seed(1)
train <- sample(1:nrow(Carseats), nrow(Carseats) / 2)
Carseats.train <- Carseats[train, ]
Carseats.test <- Carseats[-train, ]

# (b) Fit a regression tree to the training set. Plot the tree, and inter-
# pret the results. What test MSE do you obtain?

tree.carseats <- tree(Sales ~ ., data = Carseats.train)
summary(tree.carseats)
plot(tree.carseats)
text(tree.carseats, pretty = 0)
yhat <- predict(tree.carseats, newdata = Carseats.test)
mean((yhat - Carseats.test$Sales)^2)

# (c) Use cross-validation in order to determine the optimal level of
# tree complexity. Does pruning the tree improve the test MSE?

cv.carseats <- cv.tree(tree.carseats)
plot(cv.carseats$size, cv.carseats$dev, type = "b")
tree.min <- which.min(cv.carseats$dev)
points(tree.min, cv.carseats$dev[tree.min], col = "red", cex = 2, pch = 20)

prune.carseats <- prune.tree(tree.carseats, best = 8)
plot(prune.carseats)
text(prune.carseats, pretty = 0)

yhat <- predict(prune.carseats, newdata = Carseats.test)
mean((yhat - Carseats.test$Sales)^2)

# (d) Use the bagging approach in order to analyze this data. What
# test MSE do you obtain? Use the importance() function to de-
# termine which variables are most important.

bag.carseats <- randomForest(Sales ~ ., data = Carseats.train, mtry = 10, ntree = 500, importance = TRUE)
yhat.bag <- predict(bag.carseats, newdata = Carseats.test)
mean((yhat.bag - Carseats.test$Sales)^2)

importance(bag.carseats)

# (e) Use random forests to analyze this data. What test MSE do you
# obtain? Use the importance() function to determine which vari-
# ables are most important. Describe the effect of m, the number of
# variables considered at each split, on the error rate
# obtained.

rf.carseats <- randomForest(Sales ~ ., data = Carseats.train, mtry = 3, ntree = 500, importance = TRUE)
yhat.rf <- predict(rf.carseats, newdata = Carseats.test)
mean((yhat.rf - Carseats.test$Sales)^2)

importance(rf.carseats)
