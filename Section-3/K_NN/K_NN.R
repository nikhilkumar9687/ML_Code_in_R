# K Nearest Neighbour

#Importing Dataset

dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

#Encoding The Target Feature as Factor

dataset$Purchased = factor(dataset$Purchased,
                           levels = c(0, 1))

#Splitting the data into Training and Test set

library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

#Fitting KNN- classifier to the training set and Predict the test set result
install.packages('class')

library(class)

y_pred = knn(train = training_set[, -3],
             test = test_set[, -3],
             cl =training_set[, 3],
             k = 5)

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


y_grid = knn(train = training_set[, -3],
             test = grid_set,
             cl = training_set[, 3],
             k =5) 
  
plot(set[, 3],
     main = 'K Nearest Neighbour(Training Set)',
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


y_grid = knn(train = training_set[, -3],
             test = grid_set,
             cl = training_set[, 3],
             k =5) 

plot(set[, 3],
     main = 'K Nearest Neighbour(Test Set)',
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
