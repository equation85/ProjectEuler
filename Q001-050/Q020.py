#!/usr/bin/env python
# encoding=utf-8

import math

def digitSumOfFactorial(n):
	return sum([int(x) for x in str(math.factorial(n))])

if __name__=='__main__':
	print 'Sum of digits of 10! =', digitSumOfFactorial(10)
	print 'Sum of digits of 100! =', digitSumOfFactorial(100)

