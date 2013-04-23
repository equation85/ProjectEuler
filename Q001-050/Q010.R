# Encoding: utf8

library(plyr)
source('prime.R')

res <- 2
progress <- create_progress_bar('text')
progress$init(length(seq(3,2e6,by=2)))
for(i in seq(3,2e6,by=2)) {
	if(is.prime(i))
		res <- res + i
	progress$step()
}
progress$term()
cat('Sum of all the prime below 2,000,000 is', res, '\n')

