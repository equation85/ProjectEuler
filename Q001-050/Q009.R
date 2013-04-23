# Encoding: utf8

for(a in 1:floor(1000/3)) {
	for(b in (a+1):(1000-a)) {
		c <- 1000 - a - b
		if(a<b && b<c && a^2+b^2==c^2)
			cat(sprintf('Found: a=%d, b=%d, c=%d, a*b*c=%d\n',a,b,c,a*b*c))
	}
}

