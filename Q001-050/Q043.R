# encoding=utf-8
# Euler 43: Sub-string divisibility

source('pandigital.R')

is.sub.divisible <- function(x) {
  v <- c(2,3,5,7,11,13,17)
  x.chr <- as.character(x)
  if(nchar(x.chr)!=10) return(FALSE)
  p <- matrix(c(2:8,4:10), ncol=2)
  u <- sapply(1:nrow(p), function(r) substr(x.chr, p[r,1], p[r,2]))
  u <- as.numeric(u)
  return(all(u%%v==0))
}

### Test:
#is.sub.divisible(1406357289)

### Main: 
s <- 0
curr <- '0123456789'
i <- 0
repeat {
  i <- i + 1
  if(i %% 10000 == 0) cat(i,'=> ')
  if(is.na(curr)) break
  if(is.sub.divisible(curr)) {
    cat('(', curr, ') => ')
    s <- s + as.numeric(curr)
  }
  curr <- find.pandigital.character(curr)
}
cat('\n')
cat('Sum =', s, '\n')

