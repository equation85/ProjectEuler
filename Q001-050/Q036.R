# encoding=utf-8
# Euler 36

is.palindromic10 <- function(x) {
  num <- strsplit(as.character(x),'')[[1]]
  rv <- rev(num)
  return(all(num==rv))
}

is.palindromic2 <- function(x) {
  require(R.utils)
  s <- intToBin(x)
  num <- strsplit(s, '')[[1]]
  rv <- rev(num)
  return(all(num==rv))
}

### Main:
library(plyr)
s <- 0
progress <- create_progress_bar('text')
progress$init(999999)
for(i in 1:999999) {
  if(is.palindromic10(i) && is.palindromic2(i))
    s <- s + i
  progress$step()
}
progress$term()
cat('Sum =', s, '\n')

