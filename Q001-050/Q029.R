# encoding=utf-8
# Euler 29

library(gmp)
library(plyr)
a <- as.bigz(2:100)
b <- as.bigz(2:100)

res <- as.bigz(rep(NA,length(a)*length(b)))
count <- 1
progress <- create_progress_bar('text')
progress$init(length(a)*length(b))
for(i in 1:length(a)) {
  for(j in 1:length(b)) {
    res[count] <- a[i]^b[j]
    count <- count + 1
    progress$step()
  }
}
progress$term()
cat(sprintf('Number of distinct terms = %d\n',length(unique(res))))

library(hash)
res <- hash()
for(ai in a) {
  for(bi in b) {
    
