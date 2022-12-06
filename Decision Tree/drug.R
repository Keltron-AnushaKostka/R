#Decision Tree
library(C50)
library(gmodels)

drug1 <- read.csv("E:/R/drug200.csv",header=TRUE)
drug1

View(drug1)
drug1_drugA <-drug1[drug1$Drug=="drugA",]
drug1_drugB <- drug1[drug1$Drug=="drugB",]
drug1_drugX <- drug1[drug1$Drug=="drugX",]
drug1_drugY <- drug1[drug1$Drug=="drugY",]

drug1_train <- rbind(drug1_drugA[1:10,],drug1_drugB[1:10,],drug1_drugX[1:10,],drug1_drugY[1:10,] )
drug1_test <- rbind(drug1_drugA[11:22,],drug1_drugB[11:22,],drug1_drugX[11:22,],drug1_drugY[11:22,])

#building decision tree model using C50
drug1C5.0 <- C5.0(drug1_train[,-6],drug1_train$Drug,data=drug1_train)

#plot the decision tree
plot(drug1C5.0)

CrossTable(drug1_test$Drug,predict(irisC5.0,drug1_test))
pred <- predict(drug1C5.0,newdata=drug1_test)

#checking accuracy
mean(pred==drug1_test$Drug)
