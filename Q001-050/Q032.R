# encoding=utf-8
# Euler 32

is.euler32 <- function(x) {
  chr <- unlist(strsplit(as.character(x),''))
  chr <- paste(sort(chr),collapse='')
  return(chr=='123456789')
}

findNum <- function(n, print=FALSE) {
  require(gregmisc)
  a <- n
  num1 <- as.numeric(strsplit(as.character(n),'')[[1]])
  num.dict <- c(1,2,3,4,5,6,7,8,9)
  res <- NULL
  if(length(num1)==1) {
    num2.dict <- setdiff(num.dict, num1)
    candi <- permutations(8, 4)
    for(i in 1:nrow(candi)) {
      num2 <- num2.dict[candi[i,]]
      b <- as.numeric(paste(num2,collapse=''))
      c <- a * b
      if(is.euler32(c(a,b,c))) {
        if(print==TRUE) cat(sprintf('%d x %d = %d\n', a, b, c))
        res <- union(res, c)
      }
    }
  } else if(length(num1)==2) {
    num2.dict <- setdiff(num.dict, num1)
    candi <- permutations(7, 3)
    for(i in 1:nrow(candi)) {
      num2 <- num2.dict[candi[i,]]
      b <- as.numeric(paste(num2,collapse=''))
      c <- a * b
      if(is.euler32(c(a,b,c))) {
        if(print==TRUE) cat(sprintf('%d x %d = %d\n', a, b, c))
        res <- union(res, c)
      }
    }
  } else {
    warning('未料到!')
  }
  return(res)
}



### Main:
res <- NULL
for(i in 1:99) {
  res <- union(res, findNum(i,TRUE))
}
print(res)
cat(sprintf('Sum = %d\n', sum(res)))



