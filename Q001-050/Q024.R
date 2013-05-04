# encoding=utf-8

#1,2,5,4,3 => 1,3,2,4,5
#1,2,5,3,4 => 1,2,5,4,3
#1,2,4,5,3 => 1,2,5,3,4
#1,2,4,3,5 => 1,2,4,5,3
#1,2,3,4,5 => 1,2,3,5,4
#1,2,3,5,4 => 1,2,4,3,5

findNext <- function(x) {
  x.type <- class(x)
  if(!is.character(x)) x <- as.character(x)
  num <- as.integer(strsplit(x,'')[[1]])
  pos1 <- length(num)
  pos2 <- length(num)-1
  vec1 <- NULL
  repeat {
    if(num[pos1]>num[pos2]) {
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
    sub1.idx <- which.min(num[vec1[tmp.idx,1]])
    pos1 <- vec1[tmp.idx[sub1.idx],1]
    pos2 <- vec1[tmp.idx[sub1.idx],2]
    #print(c(pos1, pos2))
    left.vec <- if(pos2>1) num[1:(pos2-1)] else NULL
    center.vec <- num[pos1]
    right.vec <- setdiff(num[pos2:length(num)], center.vec)
    res <- c(left.vec, center.vec, sort(right.vec))
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

### Test:
findNext('12543')  # => 1,3,2,4,5
findNext(12534)  # => 1,2,5,4,3
findNext(12453L)  # => 1,2,5,3,4
findNext('12435')  # => 1,2,4,5,3
findNext('12345')  # => 1,2,3,5,4
findNext('12354')  # => 1,2,4,3,5
findNext('51342')  # => 5,1,4,2,3
findNext('54321')  # => NA

curr.id <- 1
curr.num <- '012'
cat(sprintf('%7d => %s\n', curr.id, curr.num))
repeat {
  curr.id <- curr.id + 1
  curr.num <- findNext(curr.num)
  if(is.na(curr.num)) break
  cat(sprintf('%7d => %s\n', curr.id, curr.num))
}
cat('Done!\n')
#      1 => 012
#      2 => 021
#      3 => 102
#      4 => 120
#      5 => 201
#      6 => 210

### Main:
library(plyr)
progress <- create_progress_bar('text')
progress$init(1e6)
curr.i <- 1
curr.num <- '0123456789'
repeat {
  curr.i <- curr.i + 1
  curr.num <- findNext(curr.num)
  progress$step()
  if(is.na(curr.num)) break
  if(curr.i==1e6) break
}
progress$term()
cat(sprintf('The %dth lexicographic permutation is %s\n', curr.i, curr.num))
