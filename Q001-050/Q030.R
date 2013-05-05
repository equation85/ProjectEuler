# encoding=utf-8
# Euler 30

sumN <- function(x, n=5) {
  num <- as.numeric(strsplit(as.character(x),'')[[1]])
  sum(num^n)
}

is.sumN.num <- function(x, n=5) {
  if(x==1) return(FALSE)
  if(x==sumN(x,n))
    return(TRUE)
  else
    return(FALSE)
}

detect.max <- function(n, iter.max=10) {
  digits <- 1
  iter <- 1
  repeat {
    num <- as.numeric(paste(rep('9',digits), collapse=''))
    sn <- sumN(num, n)
    if(num>sn) break
    if(iter>=iter.max) {
      warning('Exceed iteration maximum!')
      break
    }
    digits <- digits + 1
    iter <- iter + 1
  }
  return(digits)
}

### Test:
test.num <- c(1634, 8208, 9474)
print(data.frame(num=test.num, is.sum4=sapply(test.num,is.sumN.num,n=4)))

### Main:
library(plyr)
cat(sprintf('Maximum number of possible digits = %d\n', detect.max(5)))
res <- NULL
progress <- create_progress_bar('text')
progress$init(999999)
for(i in 1:999999) {
  if(is.sumN.num(i)) res <- c(res, i)
  progress$step()
}
progress$term()
print(res)
cat(sprintf('Sum = %d\n',sum(res)))

