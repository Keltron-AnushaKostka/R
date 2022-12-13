#RANDOM FOREST
library(randomForest)
library(caTools)

df <- read.csv("E:/R/Admission.csv", header=TRUE)
df

View(df)

df$rank<-as.factor(df$rank)
df$rank

#df$admit<-as.factor(df$admit)
#df$admit

split <- sample.split(df,SplitRatio=0.8)
split

train <- subset(df, split="TRUE")
train
test <- subset(df, split="FALSE")
test

model<-randomForest(rank~.,data=df)
plot(model)


#model<-randomForest(admit~.,data=df)
#plot(model)

pred=predict(model,test,type='Response')

#Confusion Matrix
library(e1071)
library(caret)

cm=table(Actual=test$rank, Predicted=pred)
cm
confusionMatrix(cm)




