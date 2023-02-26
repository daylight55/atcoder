S = gets.chomp.chars
ans = S.find_index{ |x| x === x.capitalize } + 1
puts ans
