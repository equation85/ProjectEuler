# encoding=utf-8
# Euler 48: Self powers

library(gmp)

self.power <- function(x) {
  z <- as.bigz(x)
  return( z^z )
}

sum.seq <- function(n) {
  pow <- lapply(1:n, self.power)
  res <- as.bigz(0)
  for(p in pow) res <- res + p
  return( res )
}

### Test:
print(sum.seq(10))

### Main:
res <- sum.seq(1000)
chr <- as.character(res)
chr <- substring(chr, nchar(chr)-9, nchar(chr))
print(res)
print(chr)

