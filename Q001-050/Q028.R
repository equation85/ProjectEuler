# encoding=utf-8
# Euler 28

diag.spiral.matrix <- function(n) {
  if(n%%2==0) stop('n must be odds')
  s <- 1
  len <- 1
  count <- 0
  curr <- 1
  repeat {
    count <- count + 1
    curr <- curr + len + 1
    s <- s + curr
    if(curr==n*n) break
    if(count==4) {
      count <- 0
      len <- len + 2
    }
    if(count>n*n) {
      warning('Exceed upper limit. Check code! Something\'s wrong!')
      break
    }
  }
  return(s)
}

### Main:
cat(sprintf('Sum of diagonals in 1001x1001 spiral matrix = %d\n', diag.spiral.matrix(1001)))

