#!/usr/bin/env python
# encoding=utf-8

"""
Euler 54: Poker hand
Note: This solution comes from http://puttamalac.wordpress.com/2012/05/07/project-euler-54-my-ultra-compact-poker-hand-evaluator/
"""

from collections import Counter
pairs = (line.split() for line in open('poker.txt'))
values = {r:i for i,r in enumerate('23456789TJQKA')}

def hand_cmp(hand):
  comp = zip(*sorted(((v, values[k]) for \
      k,v in Counter(x[0] for \
        x in hand).items()), reverse=True))
  if len(comp[0])==5:
    unicolor = len({x[1] for x in hand}) == 1
    straight = comp[1] == tuple(range(comp[1][0], comp[1][-1]-1, -1))
    comp[0] = ((1, (3,2,1)), ((3,2,0),5))[straight][unicolor]
  return comp

print sum(hand_cmp(pair[:5]) > hand_cmp(pair[5:]) for pair in pairs)

