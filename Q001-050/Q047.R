# encoding=utf-8
# Euler 47: Distinct primes factors

source('prime.R')
library(hash)

primes <- get.prime(2,100)

defactor <- function(x) {
  if(is.prime(x)) {
    #return(matrix(c(1,x,1,1),ncol=2))
    return(NA)
  }
  xl <- x
  fs <- hash()
  on.exit(clear(fs))
  curr <- 1
  repeat {
    pm <- primes[curr]
    if(xl%%pm==0) {
      if(has.key(as.character(pm),fs))
        fs[[as.character(pm)]] <- fs[[as.character(pm)]] + 1
      else
        fs[[as.character(pm)]] <- 1
      xl <- xl / pm
      if(is.prime(xl)) {
        if(has.key(as.character(xl),fs))
          fs[[as.character(xl)]] <- fs[[as.character(xl)]] + 1
        else
          fs[[as.character(xl)]] <- 1
        res <- matrix(c(as.numeric(keys(fs)),as.numeric(values(fs))), ncol=2, dimnames=list(NULL,c('factor','num')))
        return(res)
      }
    } else {
      curr <- curr + 1
      if(curr>length(primes)) {
        primes <<- get.next.prime(primes, 10)
      }
    }
  }
}

### Test:
#print(defactor(14))
#print(defactor(15))
#print(defactor(644))
#print(defactor(645))
#print(defactor(646))
#print(defactor(13))

### Main:
count <- 0
curr <- 4
res <- rep(NA, 4)
i <- 1
repeat {
  if(i%%5000==0) cat(i,'=> ')
  tmp <- defactor(curr)
  if(!is.na(tmp) && nrow(tmp)==4) {
    count <- count + 1
    res[count] <- curr
    if(count==4) break
  } else {
    count <- 0
    res <- rep(NA, 0)
  }
  curr <- curr + 1
  i <- i + 1
}
cat('\n')
cat(res, sep=', ')
cat('\n')

