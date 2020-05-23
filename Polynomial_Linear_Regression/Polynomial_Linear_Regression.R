# Polynomial Linear Regression

#Data Preprocessing

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

#Fitting Linear Regression to the dataset

linear_reg = lm (formula = Salary ~ .,
                 data = dataset)


#Fitting Polynomial Regression to the dataset

dataset$Level2 = dataset$Level ^2
dataset$Level3 = dataset$Level ^3
dataset$Level4 = dataset$Level ^4
poly_reg = lm(formula = Salary ~ .,
              data = dataset)

#Visualising The Linear Regression results

ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(linear_reg, 
                                               newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth Or Bluff (by Linear Regression)') +
  xlab("Level") +
  ylab("Salary")

#Visualising The Polynomial Regression results

ggplot() +
  geom_point(aes(x = dataset$Level,
                 y = dataset$Salary),
             colour = 'red') + 
  geom_line ( aes(x = dataset$Level,
                  y = predict(poly_reg,
                              newdata = dataset)),
              colour = 'blue') + 
  ggtitle('Truth Or Bluff (By Polynomial Regression') +
  xlab('Level') +
  ylab('Salary')


# Predicting a new result with Linear Regression

y_pred = predict(linear_reg,
                 newdata = data.frame(Level = 6.5))


# Predicting a new result with Polynomial Regression

y_poly_pred = predict(poly_reg,
                      newdata = data.frame(Level = 6.5,
                                           Level2 = 6.5 ^ 2,
                                           Level3 = 6.5 ^ 3,
                                           Level4 = 6.5 ^ 4))

