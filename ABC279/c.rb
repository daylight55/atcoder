H, W = gets.chomp.split.map(&:to_i)

S = Array.new(H){ gets.chomp.chars }
T = Array.new(H){ gets.chomp.chars }

judge = Array.new(W, false)

s_columns = S.transpose.sort
t_columns = T.transpose.sort

# s_columns.each_with_index { |s_col, i|
#   t_columns.each_with_index { |t_col, j|
#     if s_col == t_col
#       judge[i] = true
#       s_columns.delete_at(i)
#       t_columns.delete_at(j)

#       # pp s_columns
#       # pp t_columns
#       break
#     end
#   }
#   break if !judge[i]

#   # judge[i] = t_columns.any? { |t_col| t_col == s_col }
# }

W.times {
  next if s_columns.shift == t_columns.shift
  puts "No"
  return
}
puts "Yes"

# result = judge.all? {|x| x == true} ? "Yes" : "No"
# puts result
