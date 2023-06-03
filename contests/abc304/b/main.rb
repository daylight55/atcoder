#!/usr/bin/env ruby
# ref. https://qiita.com/zakuroishikuro/items/4580e3386ba954dc54f8
def count_digits(n)
  Math.log10(n.abs).to_i + 1
end

N = gets.chomp.to_i
if N == 0
  puts 0
else
  digits = count_digits(N)
  puts N.floor(-(digits - 3))
end
