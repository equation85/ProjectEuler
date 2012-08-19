# Encoding: utf8

source('Q003.R')

a <- lapply(1:10,primeFactorize)
b <- lapply(1:10, function(x) {
				   tmp <- table(a[[x]])
				   data.frame(i=x,x=as.integer(names(tmp)), v=as.integer(tmp))
			   })
c <- do.call(rbind, b)
d <- tapply(c$v, c$x, min)
d <- acast(c, i~x, mean, value.var='v')
d[is.na(d)] <- 0
e <- apply(d,2,max)
f <- as.integer(names(e))
g <- as.integer(e)
prod(f^g)

func005 <- function(x) {
	factors <- lapply(x, primeFactorize)
	b <- lapply(x, function(i) {
					   tmp <- table(factors[[i]])
					   data.frame(i=i, x=as.integer(names(tmp)), v=as.integer(tmp))
				   })
	c <- do.call(rbind,b)
	d <- tapply(c$v, c$x, min)
	d <- acast(c, i~x, mean, value.var='v')
	d[is.na(d)] <- 0
	e <- apply(d,2,max)
	f <- as.integer(names(e))
	g <- as.integer(e)
	prod(f^g)
}
cat('Answer 005:', func005(1:20),'\n')

