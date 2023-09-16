#!/usr/bin/env ruby
def main
  s = gets.chomp.chars

  size = s.size
  max_palindrome = 0

  size.times do |i|
    (i...size).each do |j|
      sub = s[i..j]
      next if sub != sub.reverse
      max_palindrome = sub.size if max_palindrome < sub.size
    end
  end

  puts max_palindrome
end

main
