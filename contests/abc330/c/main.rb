#!/usr/bin/env ruby
def main
  d = gets.chomp.to_i
  min = Float::INFINITY
  x = 0

  while x**2 <= d
    y = Math.sqrt(d - x**2).round
    min = [min, (d - x**2 - y**2).abs].min
    if min == 0
      puts min
      exit
    end
    x += 1
  end

  puts min
end

main
