a, m, l, r = gets.split.map(&:to_i)

# 数直線上でaからmおきに木を植える
# lからrまでの間に植えた木の本数を出力する

sum = 0
(l..r).each { |i|
  if i < 0 && a < 0
    sum += 1 if (i.abs - a.abs).abs % m == 0
  elsif i < 0 && a > 0
    sum += 1 if (i.abs + a.abs) % m == 0
  elsif i > 0 && a < 0
    sum += 1 if (i.abs + a.abs) % m == 0
  elsif i > 0 && a > 0
    sum += 1 if (i.abs - a.abs) % m == 0
  end
}
puts sum
