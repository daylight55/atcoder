#!/usr/bin/env ruby
def main
  n = gets.chomp.to_i
  s = gets.chomp.chars

  count = Hash.new{|h, k| h[k] = 0}
  count = {'A' => 0, 'B' => 0, 'C' => 0}
  index = 0
  s.each{|char|
    count[char] += 1
    index += 1
    break if count.values.all?{|v| v >= 1}
  }
  puts index
end

main
