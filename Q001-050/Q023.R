# encoding=utf-8

divisors <- function(n) {
	n1 <- floor(sqrt(n))
	dv <- which(n %% (1:n1) == 0)
	sort(unique(c(dv, n/dv)))
}

proper.divisor <- function(n) {
	res <- divisors(n)
	res[-length(res)]
}

what.number <- function(n) {
	pv <- sum(proper.divisor(n))
	if(pv==n) {
		return('perfect')
	} else if(pv<n) {
		return('deficient')
	} else {
		return('abundant')
	}
}

is.targetNumber <- function(n) {
	found <- TRUE
	for(i in 1:floor(n/2)) {
		if(what.number(i)=='abundant' && what.number(n-i)=='abundant') {
			found <- FALSE
			break
		}
	}
	return(found)
}

### Main:
library(plyr)
num <- laply(1:28123, is.targetNumber, .progress='text')
cat(sprintf('Sum of  all desired number = %d\n', sum(which(num==TRUE))))

# parallel version
library(parallel)
set.seed(123, "L'Ecuyer")
num <- mclapply(1:28123, is.targetNumber, mc.cores=3L)
num <- unlist(num)
cat(sum(which(num==TRUE)),'\n')

