#Download the correct libraries 
library(Hmisc)
library(magrittr) 

#Import the data 
wine <- read.table("WineQuality.csv",header=T,sep=',')


#-----
#Do prelim. analysis of the data
head(wine)
summary(wine)
#Identify missing values 
findNA <- function(df) {
  print(df %>% is.na() %>% colSums())
}
findNA(wine)
#No NAs were found, so we're good
#-----

#-----
#Use a 70/30 split for Training & Test datasets 
trainVector <- sample(nrow(wine),nrow(wine)*0.7)
trainWine <- wine[trainVector,]
testWine <- wine[-trainVector,]
#-----

#-----
#Do some initial analysis of the data 
rcorr(as.matrix(trainWine))
#From this preliminary analysis, I can that there is a 
#weak positive correlation between residual sugar and 
#perceived wine quality 
#-----
 
#-----
#Build stepwise regression model 
intercept_only <- lm(quality~ 1, data=trainWine)
all <- lm(quality~.,data=trainWine)
forward <- step(intercept_only,direction = 'forward',scope=formula(all),trace=0)
#-----

#-----
#the variation quality can be better captured by only 7 factors 
pred <- predict(forward,testWine)
modelrsdl <- data.frame(testWine$quality,round(pred),accuracy = testWine$quality-round(pred))
#-----

#-----
#Generate some general stats on the accuracy of our model
countCorrect <- nrow(modelrsdl[modelrsdl$accuracy==0,])
percentCorrect <- countCorrect/nrow(modelrsdl) * 100
rmse <- sqrt((mean(pred) - mean(testWine$quality))^2)
hist(testWine$quality - pred)
#-----