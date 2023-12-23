a, m, l, r = gets.split.map(&:to_i)

# aからmおきに木を植える
# lからrまでの間に植えた木の本数を出力する

sum = 0

if l < a && a < r
  l_num = (a - l) / m
  r_num = (r - a) / m
  sum = l_num + r_num
elsif a < l && a < r
  l_num = (l - a) / m
  r_num = (a - r) / m
  sum = r_num - l_num
elsif a > l && a > r
  l_num = (a - l) / m
  r_num = (a - r) / m
  sum = l_num - r_num
end

puts sum
