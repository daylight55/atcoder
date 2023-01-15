S = gets.chomp

total = 0
# 文字コードを1-26に変換するためのベース
base = 'A'.ord - 1
S.chars.reverse.each_with_index { |digit, i|
  total += (digit.ord - base) * (26 ** i)
  # puts "i: #{i} digit: #{digit} total: #{total}"
}
puts total
