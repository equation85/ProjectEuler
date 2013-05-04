# encoding=utf-8

library(gmp)

f1 <- as.bigz(1)
f2 <- as.bigz(1)
curr.id <- as.bigz(2)
repeat {
  curr.id <- curr.id + 1
  curr.f <- f1 + f2
  if(nchar(as.character(curr.f))>=1000) break
  f1 <- f2
  f2 <- curr.f
}
cat(sprintf('The first term contains 1000 digits is No.%s\n', as.character(curr.id)))
