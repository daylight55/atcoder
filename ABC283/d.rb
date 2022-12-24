S = gets.chomp
# S = "(a(ba))"

def good_string?(s)
  # 箱を表す配列を用意する
  box = []

  # 文字列 s の 1 文字目から順に処理する
  s.each_char.with_index do |c, i|
    # c が英小文字の場合
    if c =~ /[a-z]/
      # 箱に c のボールがすでに入っている場合、気を失う
      return false if box.include?(c)

      # 箱に c のボールを入れる
      box << c
    # c が ) の場合
    elsif c == ")"
      # ii 未満の整数 jj を探す
      jj = i - 1
      while jj >= 0
        # SS の jj 番目から ii 番目までの文字からなる文字列が良い文字列となる最大の整数 jj を取る
        break if s[jj] == "("
        jj -= 1
      end

      # jj 番目から ii 番目までの操作で箱に入れたボールをすべて、箱から取り出す
      box.pop(i - jj)
    end
  end

  # 最終的に箱が空になっていれば、高橋君が気を失わずに一連の操作を完了させられる
  box.empty?
end

result = good_string?(S) ? "Yes" : "No"
puts result
