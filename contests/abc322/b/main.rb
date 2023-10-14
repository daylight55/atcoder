#!/usr/bin/env ruby
def main
  n, m = gets.chomp.split.map(&:to_i)
  s = gets.chomp.chars
  t = gets.chomp.chars

  # head
  head = t[0..n-1] == s
  # tail
  tail = t[m-n..m] == s

  case [head, tail]
  when [true, true]
    ans = 0
  when [true, false]
    ans = 1
  when [false, true]
    ans = 2
  else
    ans = 3
  end
  puts ans
end

main
