#!/usr/bin/env ruby
N, D = gets.chomp.split.map(&:to_i)
T = gets.chomp.split.map(&:to_i)

result = 0
before = T[0]
T.shift
T.each{ |t|
  diff = t - before
  if diff <= D
    puts t
    exit
  end
  before = t
}

puts -1
