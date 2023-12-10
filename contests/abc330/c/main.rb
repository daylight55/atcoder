#!/usr/bin/env ruby
def main
  d = gets.chomp.to_i
  min = d

  (0..Math.sqrt(d).to_i).each do |x|
    y = Math.sqrt(d - x**2).round
    min = [min, (d - x**2 - y**2).abs].min
  end

  puts min
end

main
