#Support Vector Regression

#Importing Dataset

dataset = read.csv('Position_Salaries.csv')
dataset = dataset[, 2:3]

#Fitting SVR to the dataset
install.packages('e1071')
library(e1071)

svr_regressor = svm(formula = Salary ~ .,
                    data = dataset,
                    type = 'eps-regression')


# Predicting a new result

y_pred = predict(svr_regressor,
                 newdata = data.frame(Level = 6.5))

#Visualising The S V Regression results
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level,
                 y = dataset$Salary),
             colour = 'red') + 
  geom_line ( aes(x = dataset$Level,
                  y = predict(svr_regressor,
                              newdata = dataset)),
              colour = 'blue') + 
  ggtitle('Truth Or Bluff (By SVR)') +
  xlab('Level') +
  ylab('Salary')
