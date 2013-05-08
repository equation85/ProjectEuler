# encoding=utf-8
# Euler 38: Pandigital multiples

is.pandigital <- function(x) {
  num <- unlist(strsplit(as.character(x),''))
  num <- sort(num)
  num <- paste(num, collapse='')
  return(num=='123456789')
}

is.target.num <- function(x, n) {
  v <- 1:n
  return(is.pandigital(x*v))
}

total.len <- function(x, n) {
  return(nchar(paste(x*(1:n),collapse='')))
}

pandigital.value <- function(x, n) {
  return(as.numeric(paste(x*(1:n),collapse='')))
}

### Main:
library(plyr)
N0 <- 1000
count <- 0
res <- vector('list', N0)
mp <- 0
#progress <- create_progress_bar('text')
#progress$init(length(2:9))
for(n in 2:9) {
  nd <- floor(9/n)
  center <- as.numeric(paste(rep('9',nd),collapse=''))
  flag <- c(FALSE, FALSE)   # [1]=向后,[2]=向前
  if(total.len(center,n)<9) {
    flag[1] <- TRUE
  } else if(total.len(center,nd)>9) {
    flag[2] <- TRUE
  } else {
    flag[1] <- flag[2] <- TRUE
  }
  # 向后找
  if(flag[1]==TRUE) {
    curr <- center + 1
    repeat {
      len <- total.len(curr, n)
      if(len<9) {
        curr <- curr + 1
        next
      }
      if(len>9) break
      if(is.target.num(curr, n)) {
        cat(sprintf('(%d, n=%d) |',curr, n))
        count <- count + 1
        if(count>length(res)) res <- c(res, vector('list',N0))
        res[[count]] <- c(curr,n)
        v <- pandigital.value(curr, n)
        if(v>mp) mp <- v
      }
      curr <- curr + 1
    }
  }
  # 向前找
  if(flag[2]==TRUE) {
    curr <- center -1
    repeat {
      if(curr<=0) break
      len <- total.len(curr, n)
      if(len>9) {
        curr <- curr - 1
        next
      }
      if(len<9) break
      if(is.target.num(curr, n)) {
        cat(sprintf('(%d, n=%d) |',curr, n))
        count <- count + 1
        if(count>length(res)) res <- c(res, vector('list',N0))
        res[[count]] <- c(curr,n)
        v <- pandigital.value(curr, n)
        if(v>mp) mp <- v
      }
      curr <- curr - 1
    }
  }
#  progress$step()
}
#progress$term()
cat('\n')
res <- do.call(rbind, res)
print(res)
cat('Max =', mp, '\n')
