N, M = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)
B = gets.chomp.split.map(&:to_i)

total = 0
A.each_with_index{ |a, i|
  total += a if B.include?(i + 1)
}

puts total
