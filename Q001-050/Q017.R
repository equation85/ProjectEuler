# Encoding: utf8


num2word <- function(n) {
	if(!is.integer(n)) stop('n must be integer!')
	dict <- data.frame(num=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,30,40,50,60,70,80,90,100,1000),
										 word=c('one','two','three','four','five','six','seven','eight','nine','ten','eleven','twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen','twenty','thirty','forty','fifty','sixty','seventy','eighty','ninety','hundred','thousand'))

	nc <- n
#	thousand <- floor(nc/1000)
#	nc <- nc %% 1000
	hundred <- floor(nc/100)
	nc <- nc %% 100
	tens <- floor(nc/10)
	ones <- nc %% 10

	if(hundred>=1) {
		hundred.word <- paste(dict$word[dict$num==hundred],dict$word[dict$num==100],sep=' ')
	} else {
		hundred.word <- ''
	}

	if(tens>1) {
		if(ones==0) 
			tens.word <- dict$word[dict$num==tens*10]
		else 
			tens.word <- paste(dict$word[dict$num==tens*10],dict$word[dict$num==ones],sep='-')
	} else if (tens==1) {
		if(ones==0) 
			tens.word <- dict$word[dict$num==tens*10]
		else
			tens.word <- paste(dict$word[dict$num==(tens*10+ones)])
	} else if (ones!=0) {
		tens.word <- paste(dict$word[dict$num==ones])
	} else {
		tens.word <- ''
	}
	if(hundred.word!='' && tens.word!='') {
		res <- paste(hundred.word, 'and', tens.word, sep=' ')
	} else if(hundred.word!='' && tens.word=='') {
		res <- paste(hundred.word)
	} else if(hundred.word=='' && tens.word!='') {
		res <- paste(tens.word)
	} else {
		res <- ''
	}
	res
}

### Main:
num <- as.integer(1:999)
word <- sapply(num, num2word)
word <- c(word, 'one thousand')

cat(sum(nchar(gsub('[[:space:]-]','',word))), '\n')

