
#Regression Temlete

#Importing Dataset

dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Splitting the data into Training set and Test set
#install.packages('caTools')
# 
# library(caTools)
# 
# set.seed(123)
# split = sample.split(dataset$Purchased, 
#                      SplitRatio = 0.8)
# 
# 
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

#feature scaling
#training_set[, 2:3] = scale(training_set[, 2:3])
#test_set[, 2:3] = scale(test_set[, 2:3])


#Fitting  Regression to the dataset
#create Regressor Here:-

y_pred = predict(regressor,
                      newdata = data.frame(value)))

#Visualising The Regression results
(
x_grid = seq(min(dataset$Level),
             max(dataset$level),
             0.1)

ggplot() +
  geom_point(aes(x = dataset$Level,
                 y = dataset$Salary),
             colour = 'red') + 
  geom_line ( aes(x = x_grid,
                  y = predict(regressor,
                              newdata = data,frame(Level = x_grid)
                              )
                  ),
              colour = 'blue'
            ) + 
  ggtitle('') +
  xlab('') +
  ylab('')


# Predicting a new result with Polynomial Regression

y_poly_pred = predict(regressor,
                      newdata = data.frame(value)))

