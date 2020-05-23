#Multiple Linear Regression

#Importing Dataset

dataset = read.csv('50_Startups.csv')
#dataset = dataset[, 2:3]


#Encoding Categorical data

dataset$State = factor(dataset$State, 
                         levels = c('New York', 'California', 'Florida'),
                         labels =c(1, 2, 3)
                       )

# Splitting the data into Training set and Test set
#install.packages('caTools')

library(caTools)

set.seed(123)
split = sample.split(dataset$Profit, 
                     SplitRatio = 0.8)


training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Fitting Multiple Linear Regression to the training set
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data = dataset) # or '.' means all the independent combined together

summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
               data = dataset) # or '.' means all the independent combined together

summary(regressor)


regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset) # or '.' means all the independent combined together

summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend,
               data = dataset) # or '.' means all the independent combined together

summary(regressor)

#Predicting the Test set Results
y_pred = predict(regressor, 
                 newdata = test_set)


#feature scaling
#training_set[, 2:3] = scale(training_set[, 2:3])
#test_set[, 2:3] = scale(test_set[, 2:3])






