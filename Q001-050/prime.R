# Encoding: utf8

## 判断素数
#is.prime1 <- function(x) {
#  if(x<=1) return(FALSE)
#	if(x==2) return(TRUE)
#	if(x %% 2 == 0) return(FALSE)
#	flag <- TRUE
#	n <- ceiling(sqrt(x))
#	for(i in 2:n) {
#		if(x %% i == 0) {
#			flag <- FALSE
#			break
#		}
#	}
#	flag
#}

# 高效判断素数
is.prime <- function(x) {
  if(x<=1) return(FALSE)
  if(x==2 || x==3) return(TRUE)
  if(x%%6==1 || x%%6==5) {
    i <- 5
    while(i*i<=x) {
      if(x%%i==0 || x%%(i+2)==0) return(FALSE)
      i <- i + 6
    }
    return(TRUE)
  } else {
    return(FALSE)
  }
}


# 返回from:to的所有素数
get.prime <- function(from, to) {
  if(from>to) stop("'from' > 'to'")
  if(from==to) {
    if(is.prime(from))
      return(from)
    else
      return(NULL)
  }
	tmp.from <- ifelse(from %% 2==0, from+1, from)
	tmp.vec <- seq(tmp.from, to, by=2)
	if(from <= 2) tmp.vec <- c(2,tmp.vec)
	tmp.vec[sapply(tmp.vec,is.prime)]
}

# 获取后n个素数
get.next.prime <- function(x, n) {
  if(n<1) stop("n<1")
  mx <- max(x)
  curr <- if(mx%%2==0) mx+1 else mx+2
  res <- rep(NA, n)
  count <- 0
  repeat {
    if(is.prime(curr)) {
      count <- count + 1
      res[count] <- curr
    }
    curr <- curr + 2
    if(count==n) break
  }
  return(c(x,res))
}
