# encoding=utf-8
# Euler 35

source('prime.R')

circular.num <- function(x) {
  num <- as.numeric(strsplit(as.character(x),'')[[1]])
  res <- rep(NA, length(num))
  for(i in 1:length(num)) {
    res[i] <- as.numeric(paste(num,collapse=''))
    num <- c(num[-1],num[1])
  }
  return(res)
}

is.circular.prime <- function(x) {
  return(all(sapply(circular.num(x),is.prime)))
}

### Main:
library(plyr)
N <- 100
res <- rep(NA, N)
count <- 0
progress <- create_progress_bar('text')
progress$init(999999)
for(i in 1:999999) {
  if(is.circular.prime(i)) {
    count <- count + 1
    if(count>length(res)) res <- c(res, rep(NA,N))
    res[count] <- i
  }
  progress$step()
}
progress$term()
res <- res[1:(max(which(!is.na(res))))]
cat(sprintf('# = %d\n',sum(!is.na(res))))
