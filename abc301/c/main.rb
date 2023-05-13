#!/usr/bin/env ruby
s = gets.chomp.chars
t = gets.chomp.chars

# @をワイルドカードとして、イカサマによって順番は無視できるためカードの要素数が同じになることを確認する
s_tally = s.tally
t_tally = t.tally

# s,tそれぞれのtallyの各要素をキーに要素数の合計を記録する
all_tally = s_tally.merge(t_tally) { |key, s_value, t_value| s_value + t_value }

# @の数を数える
at_count = all_tally["@"] || 0
all_tally.delete("@")

# 各キーの要素数が偶数であることを確認する。奇数の場合、@を使って補えるかどうかを確認する
all_tally.each do |key, value|
  # 奇数の場合のみチェック
  if value.odd?
    # @を使って補えるかどうかを確認する
    if at_count >= value - 1
      at_count -= value - 1
      next
    # @を使って補えない場合終了
    else
      puts "No"
      exit
    end
  end
end

puts "Yes"

# # @の数を数える
# s_at_count = s_tally["@"] || 0
# t_at_count = t_tally["@"] || 0
# s_tally.delete("@")
# t_tally.delete("@")

# # 各要素の数が同じかどうかを確認する
# s_tally.each do |key, value|
#   puts "key: #{key}, value: #{value}"
#   puts "t_tally[key]: #{t_tally[key]} t_at_count: #{t_at_count}"
#   puts "s_at_count: #{s_at_count}"

#   if t_tally[key].nil?
#     puts "No"
#     exit
#   end
#   if t_tally[key] < value
#     # @を使って補えるかどうかを確認する
#     if t_at_count >= value - t_tally[key]
#       t_at_count -= value - t_tally[key]
#       next
#     else
#       puts "No"
#       exit
#     end
#   elsif t_tally[key] > value
#     # @を使って補えるかどうかを確認する
#     if s_at_count >= t_tally[key] - value
#       s_at_count -= t_tally[key] - value
#       next
#     else
#       puts "No"
#       exit
#     end
#   # 元から同じなら続行
#   elsif t_tally[key] == value
#     next
#   end
# end

# puts "Yes"
