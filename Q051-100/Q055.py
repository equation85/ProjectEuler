#!/usr/bin/env python
# encoding=utf-8

"""
Euler 55: Lychrel numbers
"""

def rev(x):
  o = str(x)
  l = list(o)
  l.reverse()
  n = ''.join(l)
  return long(n)

def isPalindromic(x):
  return x==rev(x)

def isLychrel(x, iter=50):
  xc = x
  for i in range(iter):
    xr = rev(xc)
    xc += xr
    if isPalindromic(xc): return False
  return True

if __name__=='__main__':
  count = 0
  limit = 10000L
  for x in range(1,limit):
    if isLychrel(x): count += 1
  print 'Lychrel numbers below 10000 =', count
