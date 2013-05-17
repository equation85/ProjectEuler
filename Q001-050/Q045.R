# encoding=utf-8
# Euler 45: Triangular, pentagonal, hexagonal

# T[n] = sum( 1:n )
# P[n] = 3*sum( 1:n ) - 2*n = 3*T[n] - 2*n
# H[n] = 2*sum( 1:n ) - 3/2*n = 2*T[n] - 3/2*n

get.triangle <- function(n) {
  return( n/2*(n+1) )
}

is.triangle <- function(s) {
  sq <- sqrt(8*s+1)
  if(sq%%2==1)
    return( (sq-1)/2 )
  else
    return(0)
}

get.pentagonal <- function(n) {
  return( n/2*(3*n-1) )
}

is.pentagonal <- function(s) {
  sq <- sqrt(24*s+1)
  if(sq%%6==5) 
    return( (sq+1)/6 )
  else
    return(0)
}

get.hexagonal <- function(n) {
  return( n*(2*n-1) )
}

is.hexagonal <- function(s) {
  sq <- sqrt(8*s+1)
  if(sq%%4==3)
    return( (sq+1)/4 )
  else
    return(0)
}

### Test:
#print(which(sapply(1:50,is.triangle)!=0))
#print(which(sapply(1:50,is.pentagonal)!=0))
#print(which(sapply(1:50,is.hexagonal)!=0))

### Main:
n.H <- 143
repeat {
  n.H <- n.H + 1
  Hn <- get.hexagonal(n.H)
  n.T <- is.triangle(Hn)
  n.P <- is.pentagonal(Hn)
  if(n.T!=0 && n.P!=0) {
    cat(sprintf('T[%d] = P[%d] = H[%d] = %d\n', n.T, n.P, n.H, Hn))
    break
  }
}

