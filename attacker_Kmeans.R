player_individualdata<- aggregate(data[c(10:25)],by=list(data$`Player ID`,data$`Player Forename`,data$`Player Surname`),sum)
names(player_individualdata)[1]<-paste("PlayerId")
names(player_individualdata)[2]<-paste("Player Forename")
names(player_individualdata)[3]<-paste("Player Surname")
View(player_individualdata)
library(datasets)
head(player_individualdata)
library(ggplot2)
ggplot(player_individualdata,aes(player_individualdata$Goals,player_individualdata$`Shots On Target inc goals`,color=player_individualdata$PlayerId)) +geom_point()
set.seed(20)
attkcluster<-kmeans(player_individualdata[c(8,10)],5,nstart = 20)
attkcluster
attkcluster$cluster<-as.factor(attkcluster$cluster)
ggplot(player_individualdata,aes(player_individualdata$Goals,player_individualdata$`Shots On Target inc goals`,color=attkcluster$cluster))+geom_point()
attkcluster$cluster
player_individualdata[,20]<-attkcluster$cluster
names(player_individualdata)[20]<-paste("Cluster(goals v shots on target)")
View(player_individualdata)
