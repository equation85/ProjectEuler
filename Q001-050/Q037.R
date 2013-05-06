# encoding=utf-8
# Euler 37: Truncatable primes

source('prime.R')

is.truncatable.primes <- function(x) {
  num <- as.integer(strsplit(as.character(x),'')[[1]])
  if(any(num%%2==0)) return(FALSE)
  len <- length(num)
  if(len==1) return(FALSE)
  candi <- NULL
  for(i in 1:len) {
    candi <- c(candi, as.numeric(paste(num[i:len],collapse='')), as.numeric(paste(num[1:(len-i+1)],collapse='')))
  }
  return(all(sapply(candi,is.prime)))
}

### Test:
#print(is.truncatable.primes(3797))

### Main:
count <- 0
res <- NULL
i <- 1
num <- 1
repeat {
  if(i%%10000==0) cat(i,'=> ')
  if(is.truncatable.primes(num)) {
    count <- count + 1
    cat('(',count,') =>')
    res <- c(res, num)
    if(count>=11) break
  }
  i <- i + 1
  num <- num + 2
}
print(res)
cat('Sum =', sum(res),'\n')

