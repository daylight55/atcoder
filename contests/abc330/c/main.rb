#!/usr/bin/env ruby
def main
  d = gets.chomp.to_i
  min = d

  (0..Math.sqrt(d).to_i).each do |x|
    y = Math.sqrt(d - x**2).to_i
    min = [min, (d - x**2 - y**2).abs].min
    if min == 0
      puts min
      exit
    end
  end

  puts min
end

main
