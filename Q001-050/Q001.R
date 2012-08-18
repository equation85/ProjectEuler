# Encoding: utf8

getNumbers <- function(x, max) (1:ifelse(max %% x==0,max/x-1,floor(max/x))) * x
cat('Answer 1:',sum(unique(c(getNumbers(3,1000),getNumbers(5,1000)))),'\n')
