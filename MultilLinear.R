#multiple_linear_regression

install.packages('readr')

#Importing the dataset


dataset = read.csv('C:\\MachineLearning _R Programming\\CourseFiles\\Machine Learning\\Multiple Linear Regression\\50_Startups.csv')
dataset

#Encoding Categorical Data 

dataset$State=factor(dataset$State, levels=c('New York','California', 'Florida'),labels = c(1,2,3))

dataset



#Installing caTools
library(caTools)
set.seed(123)
split= sample.split(dataset$Profit, SplitRatio = 0.8)
training_set= subset(dataset,split ==T)
test_set =subset(dataset,split==F)

training_set
test_set

#fitting simple linear regression to training set 

regressor= lm(formula = Profit ~ ., data=training_set)
summary(regressor)


#testing 

y_pred= predict(regressor,newdata =test_set)
y_pred
test_set
