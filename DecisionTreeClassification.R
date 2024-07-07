#Decision Tree Classifier 


#Importing 
dataset = read.csv('C:\\MachineLearning _R Programming\\CourseFiles\\Machine Learning\\Logistic Regression\\Social_Network_Ads.csv')
dataset
dataset <-dataset[3:5]
dataset

#Enconding the Target feature  as factor

dataset$Purchased=factor(dataset$Purchased, levels =c(0,1))


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

training_set[,1:2]= scale(training_set[,1:2])
test_set[,1:2]= scale(training_set[,1:2])

training_set
test_set

#fitting Decison Trees to the training set

install.packages('rpart')

library(rpart)
classifier= rpart(formula = Purchased ~ .,data=training_set)

#predicting the Test set Results 
y_pred= predict(classifier, newdata = test_set[-3], type='class')
y_pred


#Confusion Matrix
cm =table(test_set[,3],y_pred)
cm









