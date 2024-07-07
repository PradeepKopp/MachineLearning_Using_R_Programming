#Support Vector machine 

#Importing 
dataset = read.csv('C:\\MachineLearning _R Programming\\CourseFiles\\Machine Learning\\Logistic Regression\\Social_Network_Ads.csv')
dataset

dataset <-dataset[3:5]
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

training_set[,1:2]= scale(training_set[,1:2])
test_set[,1:2]= scale(training_set[,1:2])

training_set
test_set


#fitting SVM to the training set

install.packages('e1071')

library(e1071)
classifier= svm(formula = Purchased ~ .,data=training_set,
                type ='C-classification',kernel='linear')

#predicting the Test set Results 
y_pred= predict(classifier, newdata = test_set[-3])
y_pred

#Confusion Matrix
cm =table(test_set[,3],y_pred)
cm














