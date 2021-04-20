#' n: how many observations (per group if two-sample)
#' delta: difference between null mean and true mean
#' sd: standard deviation of data (if two-sample, within each group, assumed equal)
#' type: type of test (two-sample t, one-sample t, paired)
#' alternative: two-sided or one-sided 

power.t.test(n=22,delta=5,sd=15,type="two.sample",
             alternative="one.sided")

#' tweaks
#' increase difference true-null or increase sample size
#' delta or n can be vectors
#' $power contains vector of actual powers
#' make ggplot by creating data frame and plotting, also geom_hline(yintercept=0.05 and 1)
#' also in terms of sample size in each group, seq(10,100,5)
#' above calculates power: if you put in power=0.80 (say) and leave out n, get sample size within each group
#' 
#' 


#' sign test
#' 
x=c(3, 4, 5, 5, 6, 8, 11, 14, 19, 37)
tbl=table(x<12)
tbl
binom.test(tbl)
b=binom.test(tbl)
str(b)
b$p.value
binom.test(c(5,0))

#' power of sign test
#' null median 10
#' true distribution N(12,3)
#' sample size 20
#' write function to draw one sample of size 20 from this normal, do sign test, get P-value
#' 
#' 
my.sign=function() {
  z=rnorm(20,12,3)
  print(z)
  tbl=table(z<10)
  print(tbl)
  if (length(tbl)==1) tbl=c(tbl,0)
  test.stat=min(tbl)
  p.val=2*pbinom(test.stat,20,0.5)
  return(p.val)
}

#' write function to generate one sample from true distribution
#' test
#' 
my.sign()

#' looks ok, take out print statements
#' 
my.sign=function() {
  z=rnorm(20,12,3)
  tbl=table(z<10)
  if (length(tbl)==1) tbl=c(tbl,0)
  test.stat=min(tbl)
  p.val=2*pbinom(test.stat,20,0.5)
  return(p.val)
}

my.sign()
sim.pvals=replicate(100,my.sign())
sim.pvals
table(sim.pvals<0.05)

#' works, do 1000

sim.pvals=replicate(1000,my.sign())
table(sim.pvals<0.05)

#' estimate power as fraction of TRUEs (rejections)
