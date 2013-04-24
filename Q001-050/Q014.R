# Encoding: utf8

library(hash)
library(plyr)

getSeqNext <- function(n) {
	if(n%%2==0) 
		res <- n/2
	else
		res <- 3*n+1
	res
}

#buffer <- hash()
getLen <- function(n, use.buffer=TRUE) {
	if(length(n)!=1 && !is.integer(n))
		stop('n must be Integer, and with length 1!')
	if(use.buffer==TRUE && has.key(make.keys(n), buffer))
		return(buffer[[make.keys(n)]])
	if(n==1) return(1)
	count <- 0
	nc <- n
	repeat {
		count <- count+1
		nn <- getSeqNext(nc)
		if(nn==1) {
			res <- count+1
			break
		}
		if(use.buffer==TRUE && has.key(make.keys(nn), buffer)) {
			res <- buffer[[make.keys(nn)]] + count
			break
		}
		nc <- nn
	}
	if(use.buffer==TRUE && !has.key(make.keys(n), buffer))
		buffer[[make.keys(n)]] <- res
	res
}

### Test:
#buffer <- hash()
#getLen(13, F)
#getLen(13, T)
#clear(buffer)
#rm(buffer)

### Main:
buffer <- hash()
max.value <- c(pos=0, value=0)
progress <- create_progress_bar('text')
progress$init(1e6)
for(i in 1:1e6) {
	curr <- getLen(i, TRUE)
	if(curr>max.value['value']) {
		max.value['pos'] <- i
		max.value['value'] <- curr
	}
	progress$step()
}
progress$term()
cat(sprintf('Longest chain length = %d @ %d\n', max.value['value'], max.value['pos']))
# Longest chain length = 525 @ 837799
