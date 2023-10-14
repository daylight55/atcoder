#!/usr/bin/env ruby
def main
  input = gets.chomp.split
  n = input[0].to_i
  t = input[1].split("")
  s = Array.new(n){ gets.chomp.split("") }

  ans = []
  s.each_with_index do |si, i|
    # サイズを比較
    case si.size <=> t.size
    # sが大きい場合
    when 1
      diff = si - t
      ans << i if diff.size == 1 # tに一文字足して得られる
    # tが大きい場合
    when -1
      diff = t - si
      ans << i if diff.size == 1 # sに一文字足して得られる
    # 等しい場合
    when 0
      ans << i if si == t # 文字列が等しい
      diff = si - t
      ans << i if diff.size == 1
    end
  end

  puts ans.size
  puts ans.sort.map{ |i| i + 1 }.join(" ")

end

main
