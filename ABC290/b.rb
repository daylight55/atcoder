n, k = gets.chomp.split.map(&:to_i)
S = gets.chomp.chars

ans = Array.new(n, "x")
S.each_with_index{ |s, i|
  # 丸なら通過
  if s == "o" and k > 0
    ans[i] = "o"
    k -= 1
  end
}

puts ans.join("")
