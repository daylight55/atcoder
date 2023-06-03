#!/usr/bin/env ruby
N, A, B = gets.chomp.split.map{|i| i.to_i}
C = gets.chomp.split.map{|i| i.to_i}

ans = C.find_index {|i| i == A + B}
puts ans + 1
