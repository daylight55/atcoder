#!/bin/env/ruby

a,b = gets.split.map(&:to_i)

def solve_list(a)
  if a == 7
    result = [1, 2, 4]
  elsif a == 6
    result = [2, 4]
  elsif a == 5
    result = [1, 4]
  elsif a == 4
    result = [4]
  elsif a == 3
    result = [1, 2]
  elsif a == 2
    result = [2]
  elsif a == 1
    result = [1]
  elsif a == 0
    result = [0]
  end
  return result
end

solve_sunuke = solve_list(a) | solve_list(b)

puts solve_sunuke.inject(:+)
