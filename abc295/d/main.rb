#!/usr/bin/env ruby
N, Q = gets.chomp.split.map(&:to_i)
events = Array.new(Q){ gets.chomp.split.map(&:to_i) }
