#!/usr/bin/env python
# encoding=utf-8

"""
Euler 59: XOR decryption
"""

from collections import Counter

def xor(content, key):
  res = []
  kl = len(key)
  kc = 0
  for c in content:
    res.append(c^key[kc])
    kc += 1
    if kc==kl: kc = 0
  return tuple(res)

def chr2int(x):
  return map(ord, x)

def int2chr(x):
  return ''.join(map(chr, x))

if __name__=='__main__':
  f = open('cipher1.txt')
  rawData = f.read()
  f.close()
  code = rawData.rstrip()
  code = code.split(',')
  code = map(int, code)
  l = 'abcdefghijklmnopqrstuvwxyz'

  for k1 in l:
    for k2 in l:
      for k3 in l:
        tmpInt = xor(code, map(ord,(k1,k2,k3)))
        tmpContent = int2chr(tmpInt)
        tmp = Counter(tmpContent)
        tmpCom = tmp.most_common(2)
        if tmpCom[0][0]==' ' and tmpCom[1][0]=='e':
          print 'Sum of ASCII values =', sum(tmpInt),
          print 'key =',k1+k2+k3
          print tmpContent
          print

