# encoding=utf-8
# Euler 49: Prime permutations

source('prime.R')
source('pandigital.R')

get.all.permute <- function(x) {
  minimum <- strsplit(as.character(x), '')[[1]]
  minimum <- sort(as.integer(minimum))
  minimum <- paste(as.character(minimum), collapse='')
  res <- minimum
  curr <- minimum
  repeat {
    nxt <- find.pandigital.character(curr)
    if(is.na(nxt)) break
    curr <- nxt
    res <- c(res, curr)
  }
  return(as.numeric(res))
}

is.target <- function(x) {
  dfx <- diff(x)
  if(dfx[1]==dfx[2])
    return(TRUE)
  else
    return(FALSE)
}

primes <- get.prime(1000,9999)
primes.permu <- lapply(primes, 
                       function(x) {
                         prs <- get.all.permute(x)
                         prs <- prs[nchar(as.character(prs))==4]
                         prs <- prs[sapply(prs, is.prime)]
                       })
primes.permu <- primes.permu[sapply(primes.permu,length)>=3]
target <- lapply(primes.permu,
                 function(permu) {
                   vec <- combn(permu, 3)
                   rs <- lapply(1:ncol(vec),
                                function(i) {
                                  if(is.target(vec[,i]))
                                    return(vec[,i])
                                  else
                                    return(NULL)
                                })
                   rs <- do.call(rbind, rs)
                   return(rs)
                 })
target <- do.call(rbind, target)
target <- unique(target)

print(target)


