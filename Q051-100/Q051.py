#!/usr/bin/env python
# encoding=utf-8

import sys
sys.path.append('..')
from utils.Prime import isPrime
from itertools import combinations

def getCandiAtPos(x, pos):
  nums = ('0','1','2','3','4','5','6','7','8','9')
  xChr = list(str(x))
  xLen = len(xChr)
  res = []
  for num in nums:
    for idx in pos:
      xChr[idx] = num
    this = ''.join(xChr).lstrip('0')
    if len(this)==xLen:
      res += [int(this)]
  return tuple(res)

def getPos(x):
  xChr = str(x)
  if len(xChr)<2:
    print 'Warning: x should have 2-digits'
    return ()
  res = []
  for l in range(1,len(xChr)+1):
    res += list(combinations(range(0,len(xChr)-1),l))
  return tuple(res)

def isTargetNumber(x, minNumOfPrime):
  poses = getPos(x)
  for pos in poses:
    tmp = getCandiAtPos(x, pos)
    cum = 0
    for c in tmp:
      if isPrime(c): cum += 1
    if cum>=minNumOfPrime:
      primes = []
      for p in tmp:
        if isPrime(p): primes += [p]
      return (True, tuple(primes))
  return (False, ())

### Main:
if __name__=='__main__':
  curr = 101
  minNumOfPrime = 8
  count = 1
  while True:
    if count%10000==0:
      print count,'=>',
    res = isTargetNumber(curr, minNumOfPrime)
    if res[0]==True: break
    curr += 2
    count += 1
  print
  print res[1]

