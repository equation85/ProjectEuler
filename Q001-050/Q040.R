# encoding=utf-8
# Euler 40: Champernowne's constant

digit.range <- function(n) {
  x1 <- as.numeric(paste(c(1,rep('0',n-1)),collapse=''))
  x2 <- as.numeric(paste(rep('9',n),collapse=''))
  return(c(x1,x2))
}

digit.at <- function(n) {
  if(n<=0) stop("'n' must >0")
  if(n<10) return(n)
  dn <- 1
  left <- n
  repeat {
    curr.range <- digit.range(dn)
    curr.range.nums <- diff(curr.range) + 1
    if(left-curr.range.nums*dn<=0) {
      num.skip <- floor(left/dn)
      num.shift <- left %% dn
      if(num.shift==0) {
        num.skip <- num.skip - 1
        num.shift <- dn
      }
      num <- as.character(curr.range[1] + num.skip)
      digit <- substring(num, num.shift, num.shift)
      return(as.numeric(digit))
    } else {
      left <- left - curr.range.nums*dn
      dn <- dn + 1
    }
  }
}

### Test:
print(sapply(1:40, digit.at))

### Main:
n <- c(1, 10, 100, 1000, 10000, 100000, 1000000)
res <- sapply(n, digit.at)
print(res)
cat('Value =', prod(res), '\n')
