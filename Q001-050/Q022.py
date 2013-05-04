#!/usr/bin/env python
# encoding=utf-8

f = open('names.txt', 'r')
data = [line.strip() for line in f.readlines()]
f.close()

data = data[0]
data = data.replace('"','')
data = data.lower()
data = data.split(',')
data.sort()

def nameScore(name):
  letters = dict(zip(list('abcdefghijklmnopqrstuvwxyz'), [x+1 for x in range(26)]))
  return sum([letters[chr] for chr in name])

print 'Sum of all name scores =', sum([(i+1)*nameScore(data[i]) for i in range(len(data))])

"""
fo = open('names_score.txt', 'w')
for i in range(len(data)):
  fo.write(','.join([str(i+1), data[i], str(nameScore(data[i]))]))
  fo.write('\n')
fo.close()
"""
