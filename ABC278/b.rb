h, m = gets.chomp.split.map(&:to_i)

# 見間違えやすい時刻の判定
def judge(h, m)
  a = (h / 10) % 10
  b = h % 10
  c = (m / 10) % 10
  d = m % 10

  mis_h, mis_m = 10 * a + c, 10 * b + d

  if mis_h <= 23 and mis_m <= 59
    return true
  else
    return false
  end
end

while 0 <= h  and h <= 23
  while 0 <= m and h <= 59

    judge_result = judge(h, m)

    if judge_result
      puts "#{h} #{m}"
      exit 0
    end

    m += 1
    if m >= 60
      m = 0
      break
    end
  end

  h += 1
  if h >= 24
    h = 0
  end
end
