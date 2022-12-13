#RANDOM FOREST
library(randomForest)
library(caTools)
df <- read.csv("E:/R/winequality_red.csv", header=TRUE)
df

View(df)
df$quality<-as.factor(df$quality)
df$quality
split <-sample.split(df,SplitRatio=0.8)
split
train <- subset(df,split='TRUE')
train
test <- subset(df, split="FALSE")
test
model<-randomForest(quality~.,data=df)
plot(model)
pred=predict(model,test,type = 'Response')
#Confusion Matrix
library(e1071)
library(caret)
cm=table(Actaul=test$quality,Predicted=pred)
cm
ConfusionMatrix(cm)
