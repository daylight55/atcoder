#!/usr/bin/env ruby
def main
  n, s, k = gets.chomp.split.map(&:to_i)
  sum = 0
  n.times do |i|
    pp, qq = gets.chomp.split.map(&:to_i)
    sum += pp * qq
  end

  if sum < s
    puts sum + k
  else
    puts sum
  end
end


main
