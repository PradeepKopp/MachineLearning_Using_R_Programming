#Logistic Regression

#Importing 
dataset = read.csv('C:\\MachineLearning _R Programming\\CourseFiles\\Machine Learning\\Logistic Regression\\Social_Network_Ads.csv')
dataset

#Encoding 

dataset$Gender= factor(dataset$Gender, levels=c('Male', 'Female'), 
                       labels =c(1,0))
dataset

#Installing caTools
library(caTools)

#spliting Dataset

set.seed(123)
split= sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set= subset(dataset,split ==T)
test_set =subset(dataset,split==F)

training_set
test_set

#Feature scaling 

training_set[,3:4]= scale(training_set[,3:4])
test_set[,3:4]= scale(training_set[,3:4])

training_set
test_set

#fitting logistic regression to training set 

classifier= glm(formula = Purchased ~ .,family=binomial, data=training_set)
summary(classifier)

prob_pred= predict(classifier, type='response',newdata = test_set[-5])

y_pred = ifelse(prob_pred >0.5,1,0)
y_pred

#Confusion Matrix 
cm= table(test_set[,5],y_pred)
cm




















