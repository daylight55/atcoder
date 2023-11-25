#!/usr/bin/env ruby
def main
  n = gets.chomp.to_i
  grid = Array.new(n){ gets.chomp.split('') }

  # 条件
  # 1. 組に含まれる3 マスは相異なる。
  # 2. 3 マス全てに o が書かれている。
  # 3. マスのうち、丁度2 つが同じ行にある。
  # 4. マスのうち、丁度2 つが同じ列にある。
  count = 0
  (0..n-1).each do |i|
    (0..n-1).each do |j|
      if grid[i][j] == 'o'
        count += 1 if grid[i][j+1] == 'o' && grid[i][j+2] == 'o'
        count += 1 if grid[i+1][j] == 'o' && grid[i+2][j] == 'o'
      end
    end
  end

end

main
