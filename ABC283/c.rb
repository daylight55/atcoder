S = gets.chomp.chars

# 基本は文字数
# 連続する00の数だけ数を減らす
count = 0
oo_flg = false

S.length.times{ |i|
  # 連続した00の場合飛ばす
  if oo_flg
    oo_flg = !oo_flg
    next
  end

  if S[i] == "0"
    # 次の文字列が0ならカウントしてスキップ
    if S[i + 1] == "0"
      count = count + 1
      oo_flg = true
      next
    else
      count = count + 1
    end

  else
    count = count + 1
  end

  # puts "#{S[i]} : #{count}"
}

puts count
