#!/usr/bin/env ruby
s = gets.chomp
ans = ""

for chr in s.chars do
  if s.count(chr) == 1
    ans = chr
  end
end

if ans.empty?
  puts "-1"
else
  puts ans
end
