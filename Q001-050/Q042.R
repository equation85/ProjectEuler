# encoding=utf-8
# Euler 42: Coded triangle numbers

triangle.num <- function(n) {
  return(n * (n+1) / 2)
}

word.value <- function(word) {
  w <- tolower(word)
  w <- strsplit(w, '')[[1]]
  dict <- as.list(seq_along(letters))
  names(dict) <- letters
  res <- sum(sapply(w, function(x) dict[[x]]))
  return(res)
}

is.triangle.word <- function(word) {
  wv <- word.value(word)
  x <- sqrt(2*wv)
  xl <- floor(x)
  if(2*wv==xl*(xl+1))
    return(TRUE)
  else
    return(FALSE)
}


### Main:
library(plyr)
word <- readLines('http://projecteuler.net/project/words.txt', warn=FALSE)
word <- gsub('"', '', word)
word <- unlist(strsplit(word, ','))

count <- 0
progress <- create_progress_bar('text')
progress$init(length(word))
for(w in word) {
  if(is.triangle.word(w))
    count <- count + 1
  progress$step()
}
progress$term()
cat('# =', count, '\n')

