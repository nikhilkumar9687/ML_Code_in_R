# Logistic Regression

#Importing Dataset

dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[, 3:5]

#Splitting The dataset into Training Set and Test set
#install.packages('catools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Feature Scaling
training_set[,1:2] = scale(training_set[,1:2])
test_set[,1:2] = scale(test_set[,1:2])


#Fitting Logistic Regression to training set

#classifier = 

#Predicting the Test set results

prob_pred = predict(classifier, 
                    type = 'response',
                    newdata = test_set[-3])

y_pred = ifelse(prob_pred > 0.5,
                1,
                0)

#Making the Confusion Matrix

con_mat = table(test_set[, 3], 
                y_pred)

#Visualising The Training Set Results

library(ElemStatLearn)

set = training_set
x1 = seq(min(set[, 1]) -1,
         max(set[, 1] +1),
         by = 0.01)

x2 = seq(min(set[, 2]) -1,
         max(set[, 2] +1),
         by = 0.01)

grid_set = expand.grid(x1, x2)

colnames(grid_set) = c('Age', "EstimatedSalary")

prob_set = predict(classifier, 
                   type = 'response',
                   newdata = grid_set)

y_grid = ifelse(prob_set > 0.5,
                1,
                0)

plot(set[, 3],
     main = 'Logistic Regression(Training Set)',
     xlab = 'Age',
     ylab = 'Estimated Salary',
     xlim = range(x1),
     ylim = range(x2))

contour(x1, x2,
        matrix(as.numeric(y_grid),
               length(x1),
               length(x2)),
        add = TRUE)

points(grid_set, pch = '.',
       col = ifelse(y_grid == 1,
                    'springgreen3',
                    'tomato'))
points(set, pch = 21,
       bg = ifelse(set[, 3] == 1,
                   'green3',
                   'red3'))


#Visualising The Test Set Results

set = test_set
x1 = seq(min(set[, 1]) -1,
         max(set[, 1] +1),
         by = 0.01)

x2 = seq(min(set[, 2]) -1,
         max(set[, 2] +1),
         by = 0.01)

grid_set = expand.grid(x1, x2)

colnames(grid_set) = c('Age', "EstimatedSalary")

prob_set = predict(classifier, 
                   type = 'response',
                   newdata = grid_set)

y_grid = ifelse(prob_set > 0.5,
                1,
                0)

plot(set[, 3],
     main = 'Logistic Regression(Test Set)',
     xlab = 'Age',
     ylab = 'Estimated Salary',
     xlim = range(x1),
     ylim = range(x2))

contour(x1, x2,
        matrix(as.numeric(y_grid),
               length(x1),
               length(x2)),
        add = TRUE)

points(grid_set, pch = '.',
       col = ifelse(y_grid == 1,
                    'springgreen3',
                    'tomato'))
points(set, pch = 21,
       bg = ifelse(set[, 3] == 1,
                   'green3',
                   'red3'))
