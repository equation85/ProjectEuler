# Encoding: utf8

d <- expand.grid(1901:2000, 1:12)
d <- paste(d[,1], d[,2], 1, sep='-')

table(weekdays(as.Date(d)))   # 171
