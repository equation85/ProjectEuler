#!/usr/bin/env python
# encoding=utf-8

"""
Euler 56: Powerful digit sum
"""

def digitSum(x):
  xl = list(str(x))
  xi = map(int, xl)
  return sum(xi)

if __name__=='__main__':
  limit_a = 100
  limit_b = 100
  maxNum = {'a':0, 'b':0, 'digitSum':0}

  for a in range(1,limit_a):
    for b in range(1,limit_b):
      tmp_sum = digitSum(a**b)
      if tmp_sum>maxNum['digitSum']:
        maxNum['a'] = a
        maxNum['b'] = b
        maxNum['digitSum'] = tmp_sum
  print 'a = %d, b = %d, digitSum = %d' % (maxNum['a'], maxNum['b'], maxNum['digitSum'])

