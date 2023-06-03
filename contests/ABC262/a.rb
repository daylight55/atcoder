#!/usr/bin/env ruby
Y = gets.chomp.to_i

r = Y.modulo(4)
if r == 0
  puts Y + 2
elsif r == 1
  puts Y + 1
elsif r == 2
  puts Y
elsif r == 3
  puts Y + 3
end
