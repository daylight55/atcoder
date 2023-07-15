#!/usr/bin/env ruby
N_1, N_2, M = gets.chomp.split.map(&:to_i)
graph = Array.new(M) { gets.chomp.split.map(&:to_i) }
