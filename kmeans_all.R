
player_individualdata<- aggregate(data[c(10:25)],by=list(data$`Player ID`,data$`Player Forename`,data$`Player Surname`),sum)
names(player_individualdata)[1]<-paste("PlayerId")
names(player_individualdata)[2]<-paste("Player Forename")
names(player_individualdata)[3]<-paste("Player Surname")
#View(player_individualdata)
library(datasets)
head(player_individualdata)
library(ggplot2)
k<-input()
ggplot(player_individualdata,aes(player_individualdata$Goals,player_individualdata$`Shots On Target inc goals`,color=player_individualdata$PlayerId)) +geom_point()
set.seed(20)
attkcluster<-kmeans(player_individualdata[c(8,10)],5,nstart = 20)
attkcluster
attkcluster$cluster<-as.factor(attkcluster$cluster)
ggplot(player_individualdata,aes(player_individualdata$Goals,player_individualdata$`Shots On Target inc goals`,color=midcluster$cluster))+geom_point()
attkcluster$cluster
player_individualdata[,20]<-attkcluster$cluster
names(player_individualdata)[20]<-paste("Cluster(goals v shots on target)")
#View(player_individualdata)
library(datasets)
head(player_individualdata)
library(ggplot2)
ggplot(player_individualdata,aes(player_individualdata$Assists,player_individualdata$`Key Passes`,color=player_individualdata$PlayerId)) +geom_point()
set.seed(20)
midcluster<-kmeans(player_individualdata[c(15,16)],5,nstart = 20)
midcluster
midcluster$cluster<-as.factor(midcluster$cluster)
ggplot(player_individualdata,aes(player_individualdata$Assists,player_individualdata$`Key Passes`,color=midcluster$cluster))+geom_point()
midcluster$cluster
player_individualdata[,21]<-midcluster$cluster
names(player_individualdata)[21]<-paste("Cluster(assist v keypasses)")
View(player_individualdata)
player_individualdata[,22]<-(mean(player_individualdata$`Shots On Target inc goals`)*player_individualdata$Goals)
player_individualdata[,23]<-(mean(player_individualdata$Goals)*player_individualdata$`Shots On Target inc goals`)
names(player_individualdata)[22]<-paste("mean goals")
names(player_individualdata)[23]<-paste("mean shots")
library(datasets)
head(player_individualdata)
library(ggplot2)
ggplot(player_individualdata,aes(player_individualdata$`mean goals`,player_individualdata$`mean shots`,color=player_individualdata$PlayerId)) +geom_point()
set.seed(20)
midcluster<-kmeans(player_individualdata[c(22,23)],5,nstart = 20)
midcluster
midcluster$cluster<-as.factor(midcluster$cluster)
ggplot(player_individualdata,aes(player_individualdata$`mean goals`,player_individualdata$`mean shots`,color=midcluster$cluster))+geom_point()
midcluster$cluster
player_individualdata[,24]<-midcluster$cluster
names(player_individualdata)[24]<-paste("Cluster mean(goal v shots)")
#View(player_individualdata)
player_individualdata[,25]<-(mean(player_individualdata$`Key Passes`)*player_individualdata$Assists)
player_individualdata[,26]<-(mean(player_individualdata$Assists)*player_individualdata$`Key Passes`)
#View(player_individualdata)
names(player_individualdata)[25]<-paste("mean assist")
names(player_individualdata)[26]<-paste("mean key passes")
library(datasets)
head(player_individualdata)
library(ggplot2)
ggplot(player_individualdata,aes(player_individualdata$`mean assist`,player_individualdata$`mean key passes`,color=player_individualdata$PlayerId)) +geom_point()
set.seed(20)
midcluster<-kmeans(player_individualdata[c(25,26)],5,nstart = 20)
midcluster
midcluster$cluster<-as.factor(midcluster$cluster)
ggplot(player_individualdata,aes(player_individualdata$`mean assist`,player_individualdata$`mean key passes`,color=midcluster$cluster))+geom_point()
midcluster$cluster
player_individualdata[,27]<-midcluster$cluster
names(player_individualdata)[27]<-paste("Cluster mean(assist v keypasses)")
View(player_individualdata)

