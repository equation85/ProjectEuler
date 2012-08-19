#!/usr/bin/env Rscript
# Encoding: utf8

library(RCurl)
library(plyr)

# 切分完整的tag标签
trimThis <- function(content) {
	# 暂时不考虑<a><a /></a>这种情况
	content <- sub('^[[:space:]]+','',content)
	if(substring(content,1,1)!='<') {
		warning('First char != "<", ignoring all characters before the first "<" !')
		content <- sub('^.*?<','<',content)
	}
	# <tag />型
	tmp <- sub('(<.*?>).*','\\1',content)
	if(grepl('/>',tmp)) return(tmp)
	tag.this <- sub('<([a-zA-Z]+)[[:space:]>].*','\\1',content)
	open.pos <- gregexpr(sprintf('<%s',tag.this),content)[[1]]
	close.pos <- gregexpr(sprintf('</%s>',tag.this),content)[[1]]
	pos <- matrix(c(c(open.pos,close.pos),c(rep(1,length(open.pos)),rep(-1,length(close.pos))), c(attr(open.pos,'match.length'),attr(close.pos,'match.length'))), ncol=3, dimnames=list(NULL,c('pos','type','len')))
	pos <- pos[order(pos[,'pos']),]
	close.id <- which(cumsum(pos[,'type'])==0)[1]
	close.pos <- pos[close.id,'pos'] + pos[close.id,'len'] - 1
	return(c(substring(content,1,close.pos),substring(content,close.pos+1,)))
}

# 
problem.download <- function(url) {
	content <- getURI(url,followlocation=TRUE)
	tmp <- sub('.*(<div class="problem_content" role="problem">)','\\1',content)
	tmp <- trimThis(tmp)[1]
	tmp
}

### ------ Main ------
problems <- vector('character',391)
cat('Start\n')
progress <- create_progress_bar('text')
progress$init(391)
for(i in 1:length(problems)) {
	url <- paste('http://projecteuler.net/problem=',i,sep='')
	problems[i] <- problem.download(url)
	progress$step()
}
progress$term()
cat('Done!\n')
fo <- file('problems_raw.html','w')
cat('<html>\n<body>\n',sep='',file=fo)
cat(problems,sep='\n\n',file=fo)
cat('</body>\n</html>',sep='',file=fo)
close(fo)

# 添加编号
fi <- file('problems_raw.html','r')
fo <- file('problems.html','w')
p <- 1
repeat {
	line <- readLines(fi,n=1)
	if(length(line)==0) break
	if(grepl('<div class="problem_content"',line)) {
		cat(line,sep='\n',file=fo)
		cat(sprintf('<h3><a name="%d">Problem %1$d</a></h3>',p),sep='\n',file=fo)
		p <- p+1
	} else if(grepl('</div>',line)) {
		cat('<br/>',sep='\n',file=fo)
		cat(line,sep='\n',file=fo)
	} else {
		cat(line,sep='\n',file=fo)
	}
}
close(fo)
close(fi)
cat('Done!\n')


