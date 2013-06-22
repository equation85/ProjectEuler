#!/usr/bin/env python
# encoding=utf-8

"""
Euler 53: Combinatoric selections
"""

def combn(n, r):
  if n<r:
    print 'Error: combn(n,r), n<r'
    return None
  if r==0 or r==n: return 1
  f1 = range(n-r+1, n+1)
  f2 = range(1, r+1)
  res = 1
  for i in f1:
    res *= i
  for i in f2:
    res /= i
  return res

if __name__=='__main__':
  n_range = range(1, 101)
  limit = 1000000L
  res = 0
  for n in n_range:
    if n%2==0:
      r_range = range(0,n/2)
      if combn(n,n/2)>limit:
        res += 1
    else:
        r_range = range(0, (n+1)/2)
    for r in r_range:
      if combn(n,r)>limit: res += 2
  print 'Number =', res
