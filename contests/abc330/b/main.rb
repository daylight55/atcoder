#!/usr/bin/env ruby
def main
  n, l, r = gets.chomp.split.map(&:to_i)
  a = gets.chomp.split.map(&:to_i)
  ans = []

  a.each do |ai|
    x = [l, [r, ai].min].max
    ans << x
  end

  puts ans.join(' ')
end

main
