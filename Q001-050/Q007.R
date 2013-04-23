# Encoding: utf8

source('Q003.R')

func007 <- get.prime.at <- function(n, step=1000) {
	start.pos <- 2
	pos.step <- step
	count <- 0
	repeat {
		tmp <- get.prime(start.pos, start.pos + pos.step)
		if(count < n & count + length(tmp) >= n) break
		count <- count + length(tmp)
		start.pos <- start.pos + pos.step + 1
	}
	tmp[n-count]
}


