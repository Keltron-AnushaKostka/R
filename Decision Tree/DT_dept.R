#Decision Tree
library(C50)
library(gmodels)

dept <- read.csv("E:/R/WA_Fn-UseC_-HR-Employee-Attrition.csv",header=TRUE)
dept

attach(dept)
summary(dept)

View(dept)

dept_hr <- dept[dept$Department=="Human Resources",]
dept_rd <- dept[dept$Department=="Research & Development",]
dept_Sl <- dept[dept$Department=="Sales",]


dept_train <- rbind(dept_hr[1:30,],dept_rd[1:30,],dept_sl[1:30,])
dept_test <- rbind(dept_hr[31:63,],dept_rd[31:63,],dept_sl[31:63,])


#building decision tree model using C50
deptC5.0 <- C5.0(dept_train[,-5],dept_train$Department,data=dept_train)


plot(deptC5.0)

CrossTable(dept_test$Department,predict(deptC5.0,dept_test))
pred <- predict(deptC5.0,newdata=dept_test)

mean(pred==(dept$Department))


