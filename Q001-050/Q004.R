# Encoding: utf8

is.palindromic <- function(x) {
	cx <- as.character(x)
	cx == paste(rev(strsplit(cx,'')[[1]]),collapse='')
}

### ------ Main ------
# 穷举
res <- c(i=-1,j=-1,v=-1)
for(i in 999:100) {
	for(j in 999:i) {
		v <- i*j
		if(is.palindromic(v)) {
			if(v > res['v']) res <- c(i=i,j=j,v=v)
		}
	}
}
cat('Answer 4:',res[1],'*',res[2],'=',res[3],'\n')

