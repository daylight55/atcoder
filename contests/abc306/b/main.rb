#!/usr/bin/env ruby
A = gets.chomp.split.map(&:to_i)
bit = A.reverse.join

puts bit.to_i(2)
