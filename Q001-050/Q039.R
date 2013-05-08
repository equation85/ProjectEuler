# encoding=utf-8
# Euler 39: Integer right triangles

# 判断输入的三边长度是否构成直角三角形
is.right.triangle <- function(x) {
  if(length(x)!=3) stop("'x' must be length 3!")
  if(any(x<=0)) stop("'x' must be positive!")
  xo <- sort(x)
  return(x[1]^2+x[2]^2==x[3]^2)
}

# 找出所有周长为d的直角三角形
find.right.triangle <- function(d) {
  if(d<3) stop("'d' must not be less than 3 in this case!")
  count <- 0
  tri <- vector('list',30)
  for(a in 1:floor(d/3)) {
    for(b in a:floor(2/3*d-a)) {
      c <- d-a-b
      if(a>=c || b>=c || a+b<=c) next
      if(is.right.triangle(c(a,b,c))) {
        count <- count + 1
        if(count>length(tri))
          tri <- c(tri, vector('list',30))
        tri[[count]] <- c(a=a,b=b,c=c)
      }
    }
  }
  tri <- do.call(rbind, tri)
  return(tri)
}

### Test:
#print(find.right.triangle(120))

### Main:
library(plyr)
max.num <- 0
tri <- NA
the.p <- NA
progress <- create_progress_bar('text')
progress$init(length(3:1000))
for(p in 3:1000) {
  tmp <- find.right.triangle(p)
  n <- ifelse(is.null(tmp), 0, nrow(tmp))
  if(n>max.num) {
    max.num <- n
    tri <- tmp
    the.p <- p
  }
  progress$step()
}
progress$term()
print(t(tri))
cat('p =', p, ', Max # =', max.num, '\n')
