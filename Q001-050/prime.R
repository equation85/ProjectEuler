# Encoding: utf8

# 判断素数
is.prime <- function(x) {
  if(x<=1) return(FALSE)
	if(x==2) return(TRUE)
	if(x %% 2 == 0) return(FALSE)
	flag <- TRUE
	n <- ceiling(sqrt(x))
	for(i in 2:n) {
		if(x %% i == 0) {
			flag <- FALSE
			break
		}
	}
	flag
}

# 返回from:to的所有素数
get.prime <- function(from, to) {
	tmp.from <- ifelse(from %% 2==0, from+1, from)
	tmp.vec <- seq(tmp.from, to, by=2)
	if(from <= 2) tmp.vec <- c(2,tmp.vec)
	tmp.vec[sapply(tmp.vec,is.prime)]
}

