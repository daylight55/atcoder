S = gets.chomp.chars
T = gets.chomp.chars

s = S.tally
t = T.tally
diff = t.to_a - s.to_a

s_diff_index_list = S.each_index.select{|i| S[i] == diff[0][0] }
t_diff_index_list = T.each_index.select{|i| T[i] == diff[0][0] }

t_diff_index_list.each_with_index{ |t_i, i|
  if t_i != s_diff_index_list[i]
    puts t_i + 1
    break
  end
}
