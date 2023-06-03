N, M = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)
B = gets.chomp.split.map(&:to_i)

C = A + B
C.sort!

a_indexes = []
b_indexes = []

A.each { |a|
  a_index = C.bsearch_index { |x| x >= a }
  a_indexes << a_index if a_index
}

B.each { |b|
  b_index = C.bsearch_index {|x| x >= b }
  b_indexes << b_index if b_index
}

puts a_indexes.map { |i| i + 1 }.join(' ')
puts b_indexes.map { |i| i + 1 }.join(' ')
