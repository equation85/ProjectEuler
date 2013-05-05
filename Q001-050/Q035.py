#!/usr/bin/env python
# encoding=utf-8

import math

def isPrime(x):
  if x<=1: return False
  if x==2: return True
  if x%2==0: return False
  flag = True
  n = int(math.ceil(math.sqrt(x)))
  for i in range(n+1)[2:]:
    if x%i==0:
      flag = False
      break
  return flag

def circularNum(x):
  numStr = list(str(x))
  res = []
  for i in range(len(numStr)):
    tmp = numStr[0:1] + numStr[1:]
    res += [int(''.join(tmp))]
    numStr = numStr[1:] + numStr[0:1]
  return res

def isCircularPrime(x):
  res = [not isPrime(i) for i in circularNum(x)]
  if sum(res)==0:
    return True
  return False


if __name__=='__main__':
  res = []
  for i in range(1000000):
    if i%10000==0:
      print i,'=>',
    if isCircularPrime(i):
      res += [i]
  print res
  print '# =', len(res)

