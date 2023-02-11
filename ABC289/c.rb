N, M = gets.chomp.split.map(&:to_i)

C = Array.new(M)
a = Array.new(M)
M.times {
  C << gets.chomp.to_i
  a << gets.chomp.split.map(&:to_i)
}
