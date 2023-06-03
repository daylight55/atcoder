N = gets.chomp.to_i
S = gets.chomp.split.map(&:to_i)

result = Array.new(N)

before = 0
S.each_with_index{ |s, i|
  result[i] = s - before
  before = s
}

puts result.join(" ")
