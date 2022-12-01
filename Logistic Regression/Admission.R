#Load Libraries
library(caTools)
#Ingest the data
myData<-read.csv("E:/Data Science/Dataset/Admission.csv", header=TRUE)
myData
View(myData)
#split the data
split<-sample.split(myData,SplitRatio=0.8)
split
train<-subset(myData,split="TRUE")
train
test<-subset(myData,split="FALSE")
test
#These are categorical variables so lets tell R to convert
myData$admit<-as.factor(myData$admit)
myData$admit<-as.factor(myData$rank)
#Train the model using training data
#use glm, the general linear model function
#Department variable is admit, independant variables are gpa and rank
#the family argument should be binomial to indicate logistic regression
mymodel<-glm(admit~gpa+rank,data=train,family="binomial")
summary(mymodel)
#Run the test data through the model
res<-predict(mymodel,test,type="response")
res
res<-predict(mymodel,train,type="response")
res
#validate the model - confusion matrix
confmatrix<-table(Actual_value=train$admit,Predicted_value=res>0.5)
confmatrix
#accuracy
(confmatrix[[1,1]]+confmatrix[[2,2]])/sum(confmatrix)
