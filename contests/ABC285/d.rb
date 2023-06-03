N = gets.chomp.to_i
S = Array.new(N)
T = Array.new(N)
N.times { |i|
  S[i], T[i] = gets.chomp.split
}

# ユーザー名を全て抜き出して、使用中かを記録するマップを作る
# 上から順に変更処理を再現し、trueのユーザーに変更しようとする処理があればNoを返す。
# 循環参照に気付くには？？

all = S.concat(T).uniq.map {|x| [x, false]}.to_h
judge = true
N.times { |i|
  if all[T[i]]
    judge = false
    break
  else
    all[S[i]] = false
    all[T[i]] = true
    judge = true
  end
}

result = judge ? "Yes" : "No"
puts result
