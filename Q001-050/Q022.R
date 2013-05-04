# encoding=utf-8
# Euler 22

nm.raw <- read.table('names.txt', header=FALSE, quote='"', sep=',', stringsAsFactors=FALSE, na.strings=NULL)
nm.raw <- unlist(nm.raw)
nm.raw <- unname(nm.raw)
nm <- sort(nm.raw)
nm <- tolower(nm)

alpha.order <- function(x) {
  sum(match(strsplit(x,'')[[1]], letters))
}

name.score <- sapply(nm, alpha.order)
cat(sprintf('Sum of all the name scores = %d\n', sum((1:length(name.score))*name.score)))


