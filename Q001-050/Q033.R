# encoding=utf-8
# Euler 33

l1 <- NULL
l2 <- NULL
l3 <- NULL
for(i in 10:99) {
  for(j in (i+1):99) {
    if(i/j>=1) next
    i.chr <- strsplit(as.character(i),'')[[1]]
    j.chr <- strsplit(as.character(j),'')[[1]]
    common <- intersect(i.chr, j.chr)
    if(length(common) %in% c(0,2)) next
    ii <- as.numeric(i.chr[-which(i.chr==common)[1]])
    ji <- as.numeric(j.chr[-which(j.chr==common)[1]])
    if(ii/ji==i/j) {
      l1 <- c(l1, sprintf('%s/%s',as.character(i),as.character(j)))
      if(common!=0) {
        l3 <- rbind(l3, c(ii,ji))
      }
    }
    else
      l2 <- c(l2, sprintf('%s/%s',as.character(i),as.character(j)))
  }
}
cat('l1:\n')
print(l1)
#cat('l2:\n')
#print(l2)
cat('l3:\n')
print(l3)
print(prod(l3[,2])/prod(l3[,1]))

