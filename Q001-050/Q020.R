# encoding=utf-8

f <- function(n) {
	a <- sprintf('%.0f', prod(1:n))
	b <- strsplit(a, '')[[1]]
	c <- sum(as.integer(b))
	cat(sprintf('Sum of the digits in the number %d! = %d\n', n, c))
	c
}

### Test:
f(10)
f(100)

require(Rmpfr)
f.mpfr <- function(n) {
	v <- factorialMpfr(n)
	vs <- as(v, 'character')
	vc <- strsplit(vs, '')[[1]]
	sum(as.integer(vc))
}

f.mpfr(10)
f.mpfr(100)

