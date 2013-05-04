# encoding=utf-8
# Euler 26

analyze.fraction <- function(numerator, denominator) {
  xu <- numerator
  xd <- denominator
  v.integer <- as.character(floor(xu/xd))
  v.float <- ''
  v.show <- NULL
  xu <- xu %% xd
  pos <- NA
  repeat {
    if(xu==0) break
    xu <- 10 * xu
    if(xu %in% v.show) {
      pos <- which(v.show==xu)
      break
    }
    v.show <- c(v.show, xu)
    v.float <- paste(v.float, floor(xu/xd), sep='')
    xu <- xu %% xd
  }
  if(is.na(pos)) {
    return(c(value=paste(v.integer,'.',v.float,sep=''), cyclePart=NA))
  } else {
    cycle.begin <- pos
    cycle.end <- length(v.show)
    s.noneCycle <- if(cycle.begin>1) substring(v.float, 1, cycle.begin-1) else ''
    s.cycle <- substring(v.float, cycle.begin, cycle.end)
    return(c(value=paste(v.integer,'.',s.noneCycle,'(',s.cycle,')',sep=''),cyclePart=s.cycle))
  }
}

### Test:
n <- 2:10
v <- do.call(rbind, lapply(n, function(x) analyze.fraction(1,x)))
v <- cbind(rexpr=sprintf('1/%d',n), v, len=ifelse(is.na(v[,'cyclePart']),0,nchar(v[,'cyclePart'])))
cat('### Test:\n')
print(v)
rm(n,v)

### Main:
longest <- 0
len <- 0
for(d in 1:999) {
  tmp.len <- nchar(analyze.fraction(1,d)['cyclePart'])
  if(tmp.len>len) {
    longest <- d
    len <- tmp.len
  }
}
cat('### Main:\n')
cat(sprintf('1/%d = %s, len = %d\n', longest, analyze.fraction(1,longest)['value'], len))

