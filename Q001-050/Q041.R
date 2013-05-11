# encoding=utf-8
# Euler 41: Pandigital prime

source('prime.R')
source('pandigital.R')

### Main:
a <- 987654321
total <- factorial(9)
count <- 0
repeat {
  count <- count + 1
  if(count %% 10000 == 0) cat(count, '=> ')
  if(is.prime(a)) {
    cat('prime =', a, '\n')
    break
  }
  n <- nchar(as.character(a))
  a <- find.pandigital(a, 'prev')
  if(is.na(a)) {
    if(n==1) break
    n <- n - 1
    cat('n =', n, '\n')
    a <- as.numeric(paste(n:1,collapse=''))
  }
}

