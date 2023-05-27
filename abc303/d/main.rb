#!/usr/bin/env ruby
X, Y, Z = gets.chomp.split.map(&:to_i)
S = gets.chomp.chars

capslock = false
sum = 0
# 連続する文字をグループ化する
grouping = S.slice_when { |a, b| a != b }.to_a
# pp grouping

grouping.each do |group|
  n = group.length
  # NOTE: CapsLockの判断は次のグループの文字によっても決まる？
  # Aの場合
  if group[0] == 'A'
    # CapsLockがOFFの場合
    if capslock == false
      # Capslockを押した方が早い場合
      if n*Y > Z+X*n
        capslock = true
        sum += Z+X*n
      # そのままが早い場合
      else
        sum += n*Y
      end
    # CapsLockがONの場合
    else
      # 順当にaを押せばいい
      sum += n*X
    end
  # aの場合
  else
    # CapsLockがOFFの場合
    if capslock == false
      # 順当にaを押せばいい
      sum += n*X
    # CapsLockがONの場合
    else
      # Capslockを押した方が早い場合
      if n*Y > Z+X*n
        capslock = false
        sum += Z+X*n
      else
        sum += n*Y
      end
    end
  end
end

puts sum
