#!/usr/bin/env python
# encoding=utf-8

def binarySearch(ascArray, value):
  """在升序ascArray中二分查找value，返回相应的下标，如果未找到则返回-1。"""
  begin = 0
  end = len(ascArray) - 1
  while True:
    center = int((begin+end)/2)
    if center==begin:
      if ascArray[begin]==value:
        return begin
      elif ascArray[end]==value:
        return end
      else:
        return -1
    elif value>ascArray[center]:
      begin = center
    else:
      end = center


