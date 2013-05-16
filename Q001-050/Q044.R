# encoding=utf-8
# Euler 44: Pentagon numbers

# P(n) = n(3n-1)/2
# 可知P(n)是一个等差数列的和
# 即 P[n] = sum(a[1:n])
#    a[n] = 3n-2
#
# 设k>j
# 1) P[j] + P[k] == P[m], j < k < m
# 2) P[k] - P[j] == P[n], k > j,n
#
# 1) => sum( a[1:k] ) == sum( a[(j+1):m] )
# 2) => sum( a[(j+1):k ]) == sum( a[1:n] )
#
# 搜索思路：
# 1. 从前往后遍历P[k]
# 2. 对于每一个P[n],n<k, 计算P[k]-P[n]是否为pantagon。
# 2.1 如果是，判断P[j]+P[k]是否是pantagon。记录n.max <- n
# 2.2 如果不是，n <- n + 1，当n > min(k,n.max)时，k <- k + 1, n <- 1
# 3. 终止条件，P[k]-P[k-1] > P[n.max]

# 得到第n个pantagon number
get.pantagon <- function(n) {
  return( n/2*(3*n-1) )
}

# 判断x是否为pentagon number
# n(3n-1)/2 = s, s is integer
# 求n可得
is.pantagon <- function(x) {
  sq <- sqrt(24*x+1)
  if( sq%%6==5 ) {
    return((sq+1)/6)
  } else {
    return(0)
  }
}

### Main:
k <- 2
n.max <- Inf
res <- list(j=NA, k=NA, D=NA)
found <- FALSE
while(!found) {
  Pk <- get.pantagon(k)
  Pk1 <- get.pantagon(k-1)
  if(Pk-Pk1>get.pantagon(n.max))
    break
  for(n in 1:min(k-1,n.max)) {
    if(n==0) stop('n=0')
    Pn <- get.pantagon(n)
    Pj <- Pk - Pn
    j <- is.pantagon(Pj)
    if(j!=0 && is.pantagon(Pj+Pk)!=0) {
      cat(sprintf('<j=%d, k=%d> = %d, n.max=%d\n', j, k, Pn, n.max))
      res$j <- j
      res$k <- k
      res$D <- Pn
      n.max <- n
      found <- TRUE
      break
    }
  }
  k <- k + 1
}
print(res)


