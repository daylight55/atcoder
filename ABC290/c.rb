require 'set'

n, k = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i).sort

# def mex(array)
#   return 0 unless array.include?(0)
#   max = array.max
#   set = array.to_set
#   (0..max+1).each do |i|
#     return i unless set.include?(i)
#   end
# end

mex_list = []

(0..n-k).each{ |i|
  c = A[i, k]
  m = (0..k).find { |j| !s.include?(j) }
  # puts "c: #{c.join(' ')} m: #{m}"
  mex_list << m
}

puts mex_list.max
