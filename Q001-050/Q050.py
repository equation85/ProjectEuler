#!/usr/bin/env python
# encoding=utf-8

import sys
import time
sys.path.append('..')
from utils.Prime import isPrime, getPrime
from utils.search import binarySearch

limit = 1000000L
result = 0
numberOfPrimes = 0L

primes = getPrime(1L,limit)

primeSum = [0]
for pm in primes:
  primeSum += [primeSum[-1]+pm]

start_time = time.time()
for i in xrange(numberOfPrimes,len(primeSum)):
  for j in xrange(i-(numberOfPrimes+1),-1,-1):
    d = primeSum[i] - primeSum[j]
    if d > limit: break
    if binarySearch(primes,d)>=0:
      numberOfPrimes = i - j
      result = d
      ri = i
      rj = j
end_time = time.time()
print 'Time elapsed:', end_time-start_time
print result, 'has', numberOfPrimes, 'primes.'

