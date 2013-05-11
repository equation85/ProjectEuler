# encoding=utf-8

### 检查整数x是否为n-pandigital，若是返回具体n（[1,9]），否则返回0。
pandigital <- function(x) {
  num <- as.integer(strsplit(as.character(x),'')[[1]])
  num <- sort(unique(num))
  if(num[1]==0) return(0)
  len <- length(num)
  if(num[len]==len)
    return(len)
  return(0)
}

### 给定一个各个位由不同数组成的整数，查找各位重新排列后比它大或小的最近一个数。
find.pandigital <- function(x, direction=c('next','prev')) {
  direction <- match.arg(direction)
  a <- ifelse(direction=='next', 1, -1)
  #print(a)
  x.type <- class(x)
  if(!is.character(x)) x <- as.character(x)
  num <- as.integer(strsplit(x,'')[[1]])
  pos1 <- length(num)
  pos2 <- length(num)-1
  vec1 <- NULL
  repeat {
    if(a*num[pos1]>a*num[pos2]) {
      vec1 <- rbind(vec1, c(pos1, pos2))
      if(pos1-pos2>1) {
        pos1 <- pos1 - 1
        pos2 <- pos1 - 1
      } else {
        break
      }
    } else {
      if(pos2>1) {
        pos2 <- pos2 - 1
      } else if(pos1>2) {
        pos1 <- pos1 - 1
        pos2 <- pos1 - 1
      } else {
        break
      }
    }
  }
  if(is.null(vec1)) {
    return(NA)
  } else {
    #print(vec1)
    tmp.idx <- which(vec1[,2]==max(vec1[,2]))
    if(direction=='next')
      sub1.idx <- which.min(num[vec1[tmp.idx,1]])
    else
      sub1.idx <- which.max(num[vec1[tmp.idx,1]])
    pos1 <- vec1[tmp.idx[sub1.idx],1]
    pos2 <- vec1[tmp.idx[sub1.idx],2]
    #print(c(pos1, pos2))
    left.vec <- if(pos2>1) num[1:(pos2-1)] else NULL
    center.vec <- num[pos1]
    right.vec <- setdiff(num[pos2:length(num)], center.vec)
    res <- c(left.vec, center.vec, sort(right.vec, decreasing=ifelse(direction=='next',FALSE,TRUE)))
    res <- paste(res, collapse='')
    if(x.type=='numeric')
      return(as.numeric(res))
    else if(x.type=='integer') {
      return(as.integer(res))
    } else {
      return(res)
    }
  }
}

#### Test:
#library(plyr)
#a <- rep(NA, factorial(9))
#a[1] <- 123456789
#progress <- create_progress_bar('text')
#progress$init(factorial(9))
#count <- 1
#repeat {
#  curr <- find.pandigital(a[count], 'next')
#  progress$step()
#  if(is.na(curr)) break
#  count <- count + 1
#  a[count] <- curr
#}
#progress$term()
#
#b <- rep(NA, factorial(9))
#b[1] <- 987654321
#progress <- create_progress_bar('text')
#progress$init(factorial(9))
#count <- 1
#repeat {
#  curr <- find.pandigital(b[count], 'prev')
#  progress$step()
#  if(is.na(curr)) break
#  count <- count + 1
#  b[count] <- curr
#}
#progress$term()
#b <- rev(b)
#
#print(identical(a,b))

