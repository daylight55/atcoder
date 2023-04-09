#!/usr/bin/env ruby
H, W = gets.split.map(&:to_i)
S = Array.new(H){ gets.chomp.chars }

# S内で2文字連続するTがある時、1番目のTをPに置き換え、2番目のTをCに置き換える
S.each_with_index{ |row, i|
  row.each_with_index{ |cell, j|
    # 一番左の列から順に、TがあればPに置き換え、Cに置き換える
    if row[j] == 'T'
      if j + 1 < W && row[j + 1] == 'T'
        S[i][j] = 'P'
        S[i][j + 1] = 'C'
      end
    end

    # 一番右の列から順に、TがあればPに置き換え、Cに置き換える
    if row[W - j] == 'T'
      if j + 1 < W && row[W - j - 1] == 'T'
        S[i][W - j] = 'C'
        S[i][W - j - 1] = 'P'
      end
    end
  }
}

# Sを出力
puts S.map{ |row| row.join }
