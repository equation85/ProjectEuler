# Encoding: utf8

getFactorNum <- function(x) {
	num <- 0
	for(i in 1:floor(sqrt(x))) {
		if(x%%i==0) num <- num + 1
	}
	num <- 2*num
	if(floor(sqrt(x))==sqrt(x))
		num <- num -1
	num
}

triNum <- function(n) {
	sum(1:n)
}

### Main:
i <- 1
repeat {
	if(i%%1000==0) cat(i,'=> ')
	curr.tri <- triNum(i)
	if(getFactorNum(curr.tri)>500) {
		cat(sprintf('%d, %d\n', i, curr.tri))
		break
	}
	i <- i+1
}

