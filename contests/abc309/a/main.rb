#!/usr/bin/env ruby
A, B = gets.chomp.split.map(&:to_i)

# 行の周期性で両端を比較する
result = false
case A % 3
when 1
  result = true if B == A + 1
when 2
  result = true if B == A - 1 || B == A + 1
when 0
  result = true if B == A - 1
end

puts result ? 'Yes' : 'No'
