# Encoding: utf8

fibonacci <- function(n, a=1, b=0, p=0, q=1) {
	if(n==0)
		return(b)
	if(n%%2==0)
		return(fibonacci(n/2,a,b,p*p+q*q,2*p*q+q*q))
	return(fibonacci(n-1,a*p+a*q+b*q,b*p+a*q,p,q))
}

# 奇+偶=奇
# 奇+奇=偶
# 偶+偶=偶
# 排列顺序：奇奇偶奇奇偶奇奇偶...
# 用上面的fibonacci函数，取3n位置
s <- 0
i <- 1
repeat {
	tmp <- fibonacci(3*i)
	if(tmp > 4e6) break
	s <- s + tmp
	i <- i + 1
}
cat('Answer 2:',s,'\n')

