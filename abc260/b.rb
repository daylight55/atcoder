#!/usr/bin/env ruby

N, X, Y, Z = gets.split(" ").map(&:to_i)
A = gets.split(" ").map(&:to_i)
B = gets.split(" ").map(&:to_i)

sum = A.zip(B).map {|a, b| a + b}
results = (1..N).to_a.zip(A, B, sum)
ans = []

def pass_ans(results, index, num )
  if num <= 0
    return []
  else
    results.sort_by!{ |x| [x[index], -x[0]] }.slice!(-num..-1).map{|x| x[0]}
  end
end

ans.push(pass_ans(results, 1, X))
ans.push(pass_ans(results, 2, Y))
ans.push(pass_ans(results, 3, Z))

puts ans.flatten.sort
