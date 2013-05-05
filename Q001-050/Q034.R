# encoding=utf-8
# Euler 34

detect.max <- function() {
  count <- 1
  n9 <- factorial(9)
  repeat {
    n <- as.numeric(paste(rep('9',count),collapse=''))
    if(n>n9*count) break
    count <- count + 1
  }
  return(count)
}


is.euler34 <- function(x) {
  ft=c(1,1,2,6,24,120,720,5040,40320,362880)
  num <- as.numeric(strsplit(as.character(x),'')[[1]])
  if(x==sum(ft[num+1]))
    return(TRUE)
  return(FALSE)
}

### Test:
cat(sprintf('145 = %s\n',ifelse(is.euler34(145),'TRUE','FALSE')))

### Main:
library(plyr)
max.digits <- detect.max()
max.num <- as.numeric(paste(rep('9',max.digits),collapse=''))
cat('max.num =',max.num,'\n')
progress <- create_progress_bar('text')
progress$init(max.num-2)
s <- 0
for(i in 3:max.num) {
  if(is.euler34(i)) s <- s + i
  progress$step()
}
progress$term()
cat(sprintf('Sum = %d\n', s))

