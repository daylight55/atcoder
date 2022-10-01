#!/bin/env ruby

n = gets.chomp.to_i

o = n.to_s(16).upcase
if o.length < 2
  puts "0#{o}"
else
  puts o
end
