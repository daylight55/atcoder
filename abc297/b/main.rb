#!/usr/bin/env ruby
S = gets.chomp.chars

# 一つ目の条件
judge1 = false
x = S.index('B')
y = S.rindex('B')
judge1 = true if x.odd? != y.odd?

# 二つ目の条件
judge2 = false
x = S.index('R')
y = S.rindex('R')
z = S.index('K')
judge2 = true if x < z && z < y

puts judge1 && judge2 ? 'Yes' : 'No'
