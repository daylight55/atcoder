#!/usr/bin/env ruby

N, M = gets.split.map(&:to_i)

results = []
A = Array.new(N)

def recursive(start, index)
  if (start > M) or (index > N)
    return
  end
  result = []
  A[index] = start
  start += 1
  index += 1
  result = recursive(start, index)

  pp A
  return A
end

(1..M).each do |start|
  results << recursive(start, 0)
end
# puts results

# (1..M).each do |i|
#   A[0] = i
#   (i+1..M).each do |j|
#     A[1] = j
#     (j+1..M).each do |k|
#       A[2] = k
#       result << A.join(" ") if ( i <= M && j <= M && k <= M )
#     end
#   end
# end
