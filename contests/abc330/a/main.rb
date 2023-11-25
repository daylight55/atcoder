#!/usr/bin/env ruby
def main
  n, l = gets.chomp.split.map(&:to_i)
  a = gets.chomp.split.map(&:to_i)

  puts a.count{ |x| x >= l}
end

main
