# take a random sample of size n (from dist with parameters...)

x=rnorm(20) # standard normal
x=rnorm(20,10,3) # normal mean 10 sd 3
x=runif(10) # uniform(0,1)
x=rbinom(20,10,0.2) # binomial n=10, p=0.2
x=rexp(30) # exponential (mean 1 by default)
x=rt(40,3) # t with 3 df
x
hist(x)

# what does the population look like?
# write a function to take a big random sample
# from it and make a histogram

# dist is a thing like "rnorm"
# (passing in a function)

popdist=function(dist,...)
{
  x=dist(10000,...)
  hist(x)
}

popdist(rnorm)
popdist(rnorm,10,3)
popdist(runif)
popdist(rbinom,10,0.2)
popdist(rexp)
popdist(rt,3)
popdist(rbeta,0.5,0.5)

# take a random sample from given distribution and
# compute its mean

sample.mean=function(n,dist,...)
{
  x=dist(n,...)
  mean(x)
}

sample.mean(20,runif)
sample.mean(25,rexp)
sample.mean(20,rbinom,10,0.2)

# repeat (take a random sample, compute mean) 1000 times,
# glue results together into a vector

x=replicate(1000,sample.mean(1,rnorm))
x=replicate(1000,sample.mean(30,rnorm,10,3))
x=replicate(1000,sample.mean(5,runif))
x=replicate(1000,sample.mean(20,rbinom,1,0.2))
x=replicate(1000,sample.mean(40,rexp))
x=replicate(1000,sample.mean(30,rt,3))
x=replicate(1000,sample.mean(10,rbeta,0.5,0.5))

# make histogram and normal quantile plot of the results

hist(x)
qqnorm(x)
qqline(x)

# some playing with regression


# a curve

x=1:6
y=c(10,11,12,14,17,25)
plot(y~x)
y.lm=lm(y~x)
plot(y.lm)

# a fan-out

y=c(10,10,11,9,14,7,21,6)
x=1:8
plot(y~x)
y2.lm=lm(y~x)
plot(y2.lm)

