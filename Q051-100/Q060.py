#!/usr/bin/env python
# encoding=utf-8

"""
Euler 60: Prime pair sets
"""

import sys
sys.path.append('..')
from utils.Prime import isPrime, getPrime
from time import time


def is_prime_pair(x, y):
  v1 = int(''.join(map(str,(x,y))))
  v2 = int(''.join(map(str,(y,x))))
  return isPrime(v1) and isPrime(v2)


def get_prime_pairs(primes):
  prime_order = {}
  curr_order = 0
  prime_pair = {}
  primes_len = len(primes)
  for i in xrange(primes_len):
    pi = primes[i]
    prime_order[curr_order] = pi
    prime_pair[pi] = []
    for j in xrange(i+1, primes_len):
      pj = primes[j]
      if is_prime_pair(pj, pi):
        prime_pair[pi].append(pj)
    curr_order += 1
  return prime_order, prime_pair


def get_common_list(la, lb):
  """get common elements of two non-decreasing lists: la, lb.
  """
  ai = bi = 0
  len_a = len(la)
  len_b = len(lb)
  common = []
  while ai < len_a and bi < len_b:
    if la[ai] < lb[bi]:
      ai += 1
    elif la[ai] > lb[bi]:
      bi += 1
    else:
      common.append(la[ai])
      ai += 1
      bi += 1
  return common


def try_one(a_list, a_candi, prime_pair, num):
  if len(a_list) == num:
    return True
  while a_candi:
    curr = a_candi.pop(0)
    a_list.append(curr)
    common = get_common_list(a_candi, prime_pair[curr])
    #print 'try_one(%s, %s)' % (a_list, common)
    found = try_one(a_list, common, prime_pair, num)
    if found:
      return True
    #print 'delete: %s' % a_list[-1]
    a_list.pop(-1)
    #print 'a_list: %s' % a_list
  return False


def main():
  primes = getPrime(3, 10000)
  begin_time = time()
  prime_order, prime_pair = get_prime_pairs(primes)
  end_time = time()
  print 'Time spend = %.3fs.' % (end_time - begin_time)

  begin_time = time()
  for i in xrange(len(prime_order)):
    l = [prime_order[i]]
    candi = [x for x in prime_pair[prime_order[i]]]
    if try_one(l, candi, prime_pair, 5):
      end_time = time()
      print "Found:", l
      print "Sum:", sum(l)
      print 'Time spend = %.3fs.' % (end_time - begin_time)
      return
  end_time = time()
  print 'Time spend = %.3fs.' % (end_time - begin_time)
  print 'Can not find such set. Add more primes.'
  return


if __name__ == '__main__':
  main()
