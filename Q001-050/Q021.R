# encoding=utf-8

divisors <- function(n) {
	n1 <- floor(sqrt(n))
	dv <- which(n %% (1:n1) == 0)
	sort(unique(c(dv, n/dv)))
}

amicable.num <- function(n) {
	dv <- divisors(n)
	sum(dv[-length(dv)])
}

amicable.pair <- function(n) {
	an <- amicable.num(n)
	if(amicable.num(an)==n && an!=n)
		return(list(is=TRUE,pair=sort(c(n,an))))
	else
		return(list(is=FALSE, pair=sort(c(n,an))))
}

### Main:
v <- rep(0, 10000)
for(i in 1:length(v)) {
	if(v[i]!=0) next
	tmp <- amicable.pair(i)
	is.ami <- tmp$is
	num <- tmp$pair
	if(is.ami==TRUE && num[1]<10000 && num[2]<10000) {
		v[num[1]] <- 1
		v[num[2]] <- 1
		#cat(sprintf('v[%d]=%d, v[%d]=%d\n', num[1], v[num[1]], num[2], v[num[2]]))
	} else {
		if(num[1]>0 && num[1]<10000 && v[num[1]]==0) v[num[1]] <- -1
		if(num[2]>0 && num[2]<10000 && v[num[2]]==0) v[num[2]] <- -1
	}
}
cat(sprintf('Sum of all amicable numbers under 10000 = %d\n', sum(which(v==1))))

