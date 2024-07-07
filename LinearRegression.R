#Simple Linear Regression model 

 
install.packages('readr')

#Importing the dataset

dataset = read.csv('C:\\MachineLearning _R Programming\\CourseFiles\\Machine Learning\\Linear Regression\\Salary_Data.csv')
dataset

#Installing caTools
library(caTools)
set.seed(123)
split= sample.split(dataset$Salary, SplitRatio = 2/3)
training_set= subset(dataset,split ==T)
test_set =subset(dataset,split==F)

training_set
test_set


#fitting simple linear regresion to training set 

regressor= lm(formula = Salary ~ YearsExperience, data=training_set)
 summary(regressor)

 
 #testing 
 
 y_pred= predict(regressor,newdata  =test_set)
y_pred
test_set


#Visualize the training set results 


library(ggplot2)


ggplot(data = training_set) +
  geom_point(aes(x = YearsExperience, y = Salary), color = 'red') +
  geom_line(aes(x = YearsExperience, y = predict(regressor, newdata = training_set)), color = 'blue') +
  ggtitle('Salary vs Experience (Training set)') +
  xlab('Years of Experience') +
  ylab('Salary')


#Visualize the test set results 


library(ggplot2)


ggplot(data = test_set) +
  geom_point(aes(x = YearsExperience, y = Salary), color = 'red') +
  geom_line(aes(x = YearsExperience, y = predict(regressor, newdata = test_set)), color = 'blue') +
  ggtitle('Salary vs Experience (Test set)') +
  xlab('Years of Experience') +
  ylab('Salary')







