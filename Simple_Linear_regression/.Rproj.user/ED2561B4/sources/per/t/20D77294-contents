#Data Preprocessing

#Importing Dataset

dataset = read.csv('Salary_Data.csv')
dataset = dataset[, 2:3]


# Splitting the data into Training set and Test set

install.packages('caTools')

library(caTools)

set.seed(123)
split = sample.split(dataset$Salary, 
                     SplitRatio = 2/3)


training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#feature scaling
#training_set[, 2:3] = scale(training_set[, 2:3])
#test_set[, 2:3] = scale(test_set[, 2:3])

#Fitting Simple Linear Regression to the training set
linear_regression = lm(formula = Salary ~ YearsExperience,
                       data = training_set)

#Predicting the The Test set results

y_predict = predict(linear_regression, newdata = test_set)

 #Visualising Training Set results
install.packages('ggplot2')
library(ggplot2)

ggplot() + 
  geom_point(aes(x = training_set$YearsExperience,
                 y = training_set$Salary), 
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience,
                y = predict(linear_regression, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary Vs Experience (Training Set)') +
  xlab('Years of Experience') +
  ylab ('Salary')

#Visualising Test Set results

ggplot() + 
  geom_point(aes(x = test_set$YearsExperience,
                 y = test_set$Salary), 
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience,
                y = predict(linear_regression, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary Vs Experience (Test Set)') +
  xlab('Years of Experience') +
  ylab ('Salary')

