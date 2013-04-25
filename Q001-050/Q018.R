# Encoding: utf8

library(igraph)

idx2num <- function(i,j) {
	if(j>i) stop(sprintf('impossible (i,j)=(%d,%d)',i,j))
	i*(i-1)/2+j
}

num2idx <- function(n) {
	nc <- n
	i <- 1
	repeat {
		nc <- nc - i
		if(nc<=0) break
		i <- i + 1
	}
	j <- n - idx2num(i,1) + 1
	c(i,j)
}

gen.tri.graph <- function(level) {
	edge.list <- vector('list',100)
	edge.list[[1]] <- c('begin','1')
	count <- 1
	for(i in 1:(level-1)) {
		for(j in 1:i) {
			count <- count+1
			if(count>length(edge.list)) edge.list <- c(edge.list, vector('list',100))
			edge.list[[count]] <- c(idx2num(i,j), idx2num(i+1,j))
			count <- count+1
			if(count>length(edge.list)) edge.list <- c(edge.list, vector('list',100))
			edge.list[[count]] <- c(idx2num(i,j), idx2num(i+1,j+1))
		}
	}
	for(j in 1:level) {
		count <- count+1
		if(count>length(edge.list)) edge.list <- c(edge.list, vector('list',100))
		edge.list[[count]] <- c(idx2num(level,j), 'end')
	}

	edge.list[(count+1):length(edge.list)] <- NULL
	res <- do.call(rbind,edge.list)
	colnames(res) <- c('from','to')
	res
}

calc.max <- function(tri.data) {
	data <- unlist(tri.data)
	el <- gen.tri.graph(length(tri.data))
	weight <- rep(NA, nrow(el))
	weight[el[,2]=='end'] <- 0
	weight[el[,2]!='end'] <- data[as.integer(el[el[,2]!='end',2])]
	g <- graph.edgelist(el)
	E(g)$weight <- weight
	
	spath <- get.shortest.paths(g, 'begin', 'end', weights=max(weight)-weight)
	res <- 0
	for(i in 1:(length(spath[[1]])-1)) {
		curr.weight <- E(g)[spath[[1]][i] %->% spath[[1]][i+1]]$weight
		cat(curr.weight,' => ')
		res <- res + curr.weight
	}
	cat('OK\n')
	res
}

### Test:
raw.data <- '3
7 4
2 4 6
8 5 9 3'
tri.data <- strsplit(strsplit(raw.data,'\n')[[1]],' ')
tri.data <- lapply(tri.data, as.integer)
cat('sum =',calc.max(tri.data),'\n')

### Main:
raw.data <- '75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23'
tri.data <- strsplit(strsplit(raw.data,'\n')[[1]],' ')
tri.data <- lapply(tri.data, as.integer)
cat('sum =', calc.max(tri.data),'\n')

