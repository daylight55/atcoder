N = gets.chomp.to_i
N.times do
  a,b = gets.chomp.split.map(&:to_i)
  result = a + b
  puts result
end
