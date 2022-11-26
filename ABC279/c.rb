H, W = gets.chomp.split.map(&:to_i)

S = Array.new(H)
T = Array.new(H)
H.times { |i| S[i] = gets.chomp.chars}
H.times { |i| T[i] = gets.chomp.chars}

judge = Array.new(W, false)

s_columns = Array.new(W)
t_columns = Array.new(W)

(0..W).each { |w|
  s_columns[w] = S.transpose[w]
  t_columns[w] = T.transpose[w]
}

(0..W).each { |w|
  judge[w] = t_columns.any? { |t_col| t_col == s_columns[w] }
}

result = judge.all? {|x| x == true} ? "Yes" : "No"
puts result
