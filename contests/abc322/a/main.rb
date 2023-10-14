#!/usr/bin/env ruby
def main
  n = gets.chomp.to_i
  m = gets.chomp

  ans =  m.index("ABC")

  if ans.nil?
    ans = -1
  else
    ans += 1
  end
  puts ans
end


main
