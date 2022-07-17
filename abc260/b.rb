#!/usr/bin/env ruby

# N, X, Y, Z = gets.split(" ").map(&:to_i)
# A = gets.split(" ").map(&:to_i)
# B = gets.split(" ").map(&:to_i)

N, X, Y, Z = "15 4 3 2".split(" ").map(&:to_i)
A = "30 65 20 95 100 45 70 85 20 35 95 50 40 15 85".split(" ").map(&:to_i)
B = "0 25 45 35 65 70 80 90 40 55 20 20 45 75 100".split(" ").map(&:to_i)

sum = A.zip(B).map {|a, b| a + b}
results = (1..N).to_a.zip(A, B, sum)
ans = []

def pass_ans(results, index, num )
  if num <= 0
    return []
  else
    results_new = results.sort_by{ |x| [x[index], -x[0]] }.slice!(-num..-1)
    # results.sort_by{ |x| [x[index], -x[0]] }.slice!(-num..-1).map{|x| x[0]}
    return results_new
  end
end

ans.push(pass_ans(results, 1, X))
pp results
ans.push(pass_ans(results, 2, Y))
pp results
ans.push(pass_ans(results, 3, Z))
pp results

puts results.map{|x| x[0]}.flatten.sort
