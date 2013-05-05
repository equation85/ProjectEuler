# encoding=utf-8
# Euler 31

dict <- c(1, 2, 5, 10, 20, 50, 100, 200)

# 计算利用base向量获得加和为s的所有可能情况数
combn.num <- function(s, base) {
  if(length(base)==1) {
    if(base!=1) {
      warning('The minumum base is not 1! Truncation may be happen!')
    }
    return(1)
  }
  bs <- sort(base, decreasing=TRUE)
  n <- floor(s/bs[1])
  sn <- 0
  for(ni in 0:n) {
    sn <- sn + combn.num(s-ni*bs[1], bs[-1])
  }
  return(sn)
}

### Test:
print(combn.num(5, c(5,2,1)))

### Main:
cat(sprintf('#(200) = %d\n', combn.num(200, dict)))

