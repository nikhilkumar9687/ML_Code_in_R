#Decision_Tree_Regression

dataset = read.csv('Position_Salaries.csv')

dataset = dataset[2:3]

#Fitting Decision Tree Regression
install.packages('rpart')
library(rpart)

dec_tre_reg = rpart(formula = Salary ~ .,
                    data = dataset,
                    control = rpart.control(minsplit = 1))

#Predicting the Results
y_pred = predict(dec_tre_reg, data.frame(Level = 6.5))

#Visualising the Decision Tree Regression for Higher Resolution
library(ggplot2)

x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)

ggplot() +
  geom_point(aes(x = dataset$Level,
                 y = dataset$Salary),
             color = 'Red') +
  geom_line(aes( x = x_grid,
                 y = predict(dec_tre_reg, newdata = data.frame(Level = x_grid))),
            color = 'Blue') +
  ggtitle("Truth Or Bluff (Decision Tree Regression)") +
  xlab('Level') +
  ylab('Salary')


