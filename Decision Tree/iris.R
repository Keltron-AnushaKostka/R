#Decision Tree
library(C50)
library(gmodels)


View(iris)

iris_setosa <-iris[iris$Species=="setosa",]
iris_versicolor <- iris[iris$Species=="versicolor",]
iris_virginica <- iris[iris$Species=="virginica",]

iris_train <- rbind(iris_setosa[1:25,],iris_versicolor[1:25,],iris_virginica[1:25,])
iris_test <- rbind(iris_setosa[26:50,],iris_versicolor[26:50,],iris_virginica[26:50,])

#building decision tree model using C50
irisC5.0 <- C5.0(iris_train[,-5],iris_train$Species,data=iris_train)

#plot the decision tree
plot(irisC5.0)

CrossTable(iris_test$Species,predict(irisC5.0,iris_test))
pred <- predict(irisC5.0,newdata=iris_test)

#checking accuracy
mean(pred==iris_test$Species)

