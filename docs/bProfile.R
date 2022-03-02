### R code from vignette source '/home/ken/teaching/d29/notes/bProfile.Rnw'

###################################################
### code chunk number 1: bProfile.Rnw:83-92
###################################################
library(car)
active=read.table("profile.txt",header=T)
attach(active)
response=cbind(reading,dance,tv,ski)
response
active.1=lm(response~job)
activity=colnames(response)
activity
activity.df=data.frame(activity)
activity.df
active.2=Manova(active.1,idata=activity.df,
      idesign=~activity)


###################################################
### code chunk number 2: bProfile.Rnw:101-102
###################################################
active.2


###################################################
### code chunk number 3: bProfile.Rnw:130-135
###################################################
dogs=read.table("dogs.txt",header=T)
dogs
attach(dogs)
response=cbind(lh0,lh1,lh3,lh5)
dogs.lm=lm(response~drug)


###################################################
### code chunk number 4: bProfile.Rnw:148-153
###################################################
times=colnames(response)
times.df=data.frame(times)
dogs.manova=Manova(dogs.lm,idata=times.df,
     idesign=~times)
dogs.manova


###################################################
### code chunk number 5: bProfile.Rnw:167-168
###################################################
head(dogs,n=5)


###################################################
### code chunk number 6: bProfile.Rnw:184-185
###################################################
library(dplyr) ; library(tidyr)


###################################################
### code chunk number 7: bProfile.Rnw:198-199
###################################################
dogs %>% gather(time,lh,lh0:lh5) %>% head(12)


###################################################
### code chunk number 8: bProfile.Rnw:213-215
###################################################
dogs %>% gather(timex,lh,lh0:lh5) %>% 
   separate(timex,into=c("junk","time"),sep=2) %>% head(11)


###################################################
### code chunk number 9: bProfile.Rnw:245-247
###################################################
d3=dogs %>% gather(timex,lh,lh0:lh5) %>% 
   separate(timex,into=c("junk","time"),sep=2)


###################################################
### code chunk number 10: bProfile.Rnw:252-254
###################################################
dogs %>% gather(timex,lh,lh0:lh5) %>% 
   separate(timex,into=c("junk","time"),sep=2) -> d2


###################################################
### code chunk number 11: bProfile.Rnw:309-311
###################################################
detach(dogs) 
attach(d2)


###################################################
### code chunk number 12: bProfile.Rnw:315-316 (eval = FALSE)
###################################################
## interaction.plot(time,drug,lh)


###################################################
### code chunk number 13: ibrahimovic
###################################################
interaction.plot(time,drug,lh)


###################################################
### code chunk number 14: bProfile.Rnw:349-357
###################################################
detach(d2)
attach(dogs)
response=cbind(lh1,lh3,lh5)
dogs.lm=lm(response~drug)
times=colnames(response)
times.df=data.frame(times)
dogs.manova=Manova(dogs.lm,idata=times.df,
                   idesign=~times)


###################################################
### code chunk number 15: bProfile.Rnw:367-368
###################################################
dogs.manova


###################################################
### code chunk number 16: bProfile.Rnw:388-390
###################################################
detach(dogs)
attach(d2)


###################################################
### code chunk number 17: bProfile.Rnw:394-396 (eval = FALSE)
###################################################
## plot(lh~time,col=drug,pch=19)
## legend("topright",legend=drug,fill=1:2)


###################################################
### code chunk number 18: palazzo
###################################################
plot(lh~time,col=drug,pch=19)
legend("topright",legend=levels(drug),fill=1:2)

# ggplot with dogs joined by lines

#detach(d2)
#detach(dogs)
dogs

# need subject number

dogs %>% mutate(subject=1:8) 
%>%  gather(time,loghist,lh0:lh5) -> d4

d4
library(ggplot2)
ggplot(d4,aes(time,loghist,group=subject,colour=drug))+geom_line()

qplot(time,loghist,data=d4,group=subject,colour=drug,geom=c("point","line"))

# or pull off the lh's and plot time actually as time

dogs %>% mutate(subject=1:8) %>%  
  gather(time,loghist,lh0:lh5) %>%
  separate(time,into=c("junk","tt"),sep=2) %>% 
  mutate(tt=as.numeric(tt)) %>% 
  select(-junk) -> d5

head(d5)

str(d5)
ggplot(d5,aes(tt,loghist,group=subject,colour=drug))+geom_point()+geom_line
###################################################
### code chunk number 19: bProfile.Rnw:423-426
###################################################
detach(d2)
head(active,n=4)
active %>% gather(activity,score,reading:ski) -> active.long


###################################################
### code chunk number 20: bProfile.Rnw:443-445
###################################################
active.long[c(1:7,12:15),]
dim(active.long) # how many rows and columns


###################################################
### code chunk number 21: bProfile.Rnw:449-450
###################################################
detach(active)


###################################################
### code chunk number 22: bProfile.Rnw:454-456
###################################################
rm(activity)
rm(id)


###################################################
### code chunk number 23: southport
###################################################
attach(active.long)
interaction.plot(activity,job,score,
                 lty=c("solid","dashed","dotdash"))


