#!/usr/bin/env ruby
def main
  a, b = gets.chomp.split.map(&:to_i)

  puts a ** b + b ** a
end

main
