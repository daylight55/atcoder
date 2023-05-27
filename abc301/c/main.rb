#!/usr/bin/env ruby
s = gets.chomp.chars
t = gets.chomp.chars
atcoder = "atcoder".chars

# @をワイルドカードとして、イカサマによって順番は無視できるためカードの要素数が同じになることを確認する
s_tally = s.tally
t_tally = t.tally

# @の数をカウントする
s_at_count = s_tally['@'] || 0
t_at_count = t_tally['@'] || 0
s_tally.delete('@')
t_tally.delete('@')

# s,tそれぞれのtallyのキーをマージして配列にする
all_keys = s_tally.keys | t_tally.keys

# 各要素の数が同じかどうかを確認する
all_keys.each do |key|
  value = s_tally[key] || t_tally[key]

  # キーの組み合わせを確認する。両方に存在
  if s_tally[key] && t_tally[key] && key in atcoder
    # 両方に存在する場合はどちらが多いかを確認する
    # tが多い場合
    if s_tally[key] > t_tally[key]
      if t_tally[key] + t_at_count >= s_tally[key]
        t_at_count -= s_tally[key] - t_tally[key]
      else
        puts "No"
        exit
      end
    # sが多い場合
    elsif s_tally[key] < t_tally[key]
      if s_tally[key] + s_at_count >= t_tally[key]
        s_at_count -= t_tally[key] - s_tally[key]
      else
        puts "No"
        exit
      end
    end
  # sのみに存在
  elsif s_tally[key] && !t_tally[key]
    # tが@で補える場合は一致する
    if s_tally[key] <= t_at_count
      t_at_count -= s_tally[key]
    else
      puts "No"
      exit
    end
  # tのみに存在
  elsif !s_tally[key] && t_tally[key]
    # sが@で補える場合は一致する
    if t_tally[key] <= s_at_count
      s_at_count -= t_tally[key]
    else
      puts "No"
      exit
    end
  end
end

puts "Yes"
