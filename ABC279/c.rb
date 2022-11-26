H, W = gets.chomp.split.map(&:to_i)

S = Array.new(H){ gets.chomp.chars }
T = Array.new(H){ gets.chomp.chars }

judge = Array.new(W, false)

s_columns = S.transpose.sort
t_columns = T.transpose.sort

W.times {
  next if s_columns.shift == t_columns.shift
  puts "No"
  return
}
puts "Yes"
