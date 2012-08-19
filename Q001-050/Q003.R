# Encoding: utf8

# 判断素数
is.prime <- function(x) {
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

# 按素数表顺序递归分解
primeFactorize <- function(x) {
	factorizer <- local({
		max.n <- 100
		primes <- get.prime(2,max.n)
		factors <- c()
		fun <- function(val, p) {
			repeat {
				while(p > length(primes)) {
					max.n <<- max.n + 100
					primes <<- get.prime(2,max.n)
				}
				if(val %% primes[p] == 0) break
				p <- p + 1
			}
			factors <<- c(factors,primes[p])
			if(!is.prime(val/primes[p]))
				fun(val / primes[p], p)
			else
				factors <<- c(factors,val/primes[p])
		}
		fun(x,1)
		factors
	})
	factorizer
}

### ------ Main ------
print(primeFactorize(600851475143))
