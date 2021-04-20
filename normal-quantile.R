sign.data=c(3,4,5,5,6,8,11,14,19,37)
sign.data
qqnorm(sign.data)
qqline(sign.data)

boxplot(sign.data)
hist(sign.data)
stem(sign.data)

random.norm=rnorm(100,20,5)
random.norm
hist(random.norm)
boxplot(random.norm)
qqnorm(random.norm)
qqline(random.norm)

random.t=rt(100,3)
random.t
hist(random.t)
boxplot(random.t)
qqnorm(random.t)
qqline(random.t)

random.unif=runif(100,0,1)
random.unif
hist(random.unif)
boxplot(random.unif)
qqnorm(random.unif)
qqline(random.unif)
