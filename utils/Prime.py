#!/usr/bin/env python
# encoding=utf-8

def isPrime(x):
  "高效判断素数"
  if x<=1: return False
  if x==2 or x==3: return True
  if x%6==1 or x%6==5:
    i = 5
    while i*i<=x:
      if x%i==0 or x%(i+2)==0:
        return False
      i += 6
    return True
  else:
    return False

def getPrime(begin, end):
  if begin>end:
    print 'Error: begin>end.'
    return []
  if begin==end:
    return begin if isPrime(begin) else []
  if begin%2==0: begin += 1
  if begin<3:
    begin = 3
    res = [2]
  for i in xrange(begin,end+1,2):
    if isPrime(i): res += [i]
  return res

