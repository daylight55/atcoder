#!/usr/bin/env ruby
def main
  n, m = gets.chomp.split.map(&:to_i)
  a = gets.chomp.split.map(&:to_i)
  b = gets.chomp.split.map(&:to_i)

  # Aの売り手が、ちょうどBの買い手より大きくなる時の最小値を求める

  # a, bの各要素の差を取った配列を作成
  diff = a.zip(b).map { |a, b| a - b }
  # diffが最小値になった時の組み合わせとなったbのindexを全て取得
  min_diff_index = diff.each_index.select { |i| diff[i] == diff.min }
  # min_diff_indexの中で、bの値が最大のものを取得
  max_b_index = min_diff_index.max_by { |i| b[i] }
  # max_b_indexの時のAの値で条件分岐
  


end

main
