#!/usr/bin/env ruby
s = gets.chomp
ans = ""

s.chars.map { |chr| ans = chr if s.count(chr) == 1 }
puts ans.empty? ? "-1" : ans
