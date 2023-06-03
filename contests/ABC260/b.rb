#!/usr/bin/env ruby

N, X, Y, Z = gets.split(" ").map(&:to_i)
A = gets.split(" ").map(&:to_i)
B = gets.split(" ").map(&:to_i)

sum = A.zip(B).map {|a, b| a + b}
results = (1..N).to_a.zip(A, B, sum)
ans = []

def pass_candidates(results, index, num )
  return num <= 0 ? [] : results.sort_by!{ |x| [x[index], -x[0]] }.slice!(-num..-1).map{|x| x[0]}
end

# Math
ans.push(pass_candidates(results, 1, X))
# English
ans.push(pass_candidates(results, 2, Y))
# Math + English
ans.push(pass_candidates(results, 3, Z))

puts ans.flatten.sort
