#!/usr/bin/env ruby
def main
  n = gets.chomp.to_i
  a = gets.chomp.split.map(&:to_i)
  a.uniq.count == 1 ? puts("Yes") : puts("No")
end


main
