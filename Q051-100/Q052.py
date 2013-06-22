#!/usr/bin/env python
# encoding=utf-8

"""
Euler 52: Permuted multiples
"""

def sortDigit(x):
  xChr = list(str(x))
  xChr.sort()
  return ''.join(xChr)

def haveSameDigits(x):
  if len(x)<2:
    print 'Error: len(x) must >=2!'
    return None
  xChr = map(sortDigit, x)
  x0 = xChr[0]
  flag = True
  for x in xChr[1:]:
    if x0!=x:
      flag = False
      break
  return flag

if __name__=='__main__':
  curr = 1
  while True:
    xs = [i*curr for i in range(1,7)]
    if haveSameDigits(xs):
      break
    curr += 1
  print 'The smallest positive integer =', curr
