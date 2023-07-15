#!/usr/bin/env ruby
N, K = gets.chomp.split.map(&:to_i)
medicines = Array.new(N) { gets.chomp.split.map(&:to_i) }

# 薬を飲み続ける期間でソート
medicines.sort_by! { |a, b| a }

# 薬を飲み続ける期間
day = 0
# 薬の合計量。初日は全ての合計を飲む。期間を超過したら順番に飲む量を減らす。
taken = medicines.map { |a, b| b }.inject(:+)

# 初日から既にK錠以下だったら終了
if taken <= K
  puts day + 1
  exit
end

# 初日の薬を飲み続ける期間の最小値
day = medicines[0][0]

medicines.each_with_index do |(a, b), i|
  # 薬リストを順に消化していく
  taken -= b

  # puts "day: #{day}, taken: #{taken}, a: #{a}, b: #{b}"

  # K錠以下になったら終了
  if taken <= K
    # 次の日が答え
    day += 1
    break
  end

  # 期間が変わっていたら日付を進める
  if medicines[i + 1][0] != day
    day = medicines[i + 1][0]
  end
end

puts day
