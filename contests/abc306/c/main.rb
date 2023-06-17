#!/usr/bin/env ruby
N = gets.chomp.to_i
A = gets.chomp.split.map(&:to_i)

ans = []
(1..N).each do |i|

  # iがAの中に3つあるので、その真ん中のインデックスを求める
  # first = A.find_index(i)
  # last = A.rindex(i)
  # second = A[first+1..last-1].find_index(i) + first

  # puts "i: #{i} A[first+1..last-1]: #{A[first+1..last-1]} first: #{first}, last: #{last}, second: #{second}"

  ans << second + 1

end

puts ans.join(" ")
