S = gets.chomp.chars

# 箱。文字ごとにtrue/false
box = {}
# 文字列追加ごとにその文字のインデックスを追加
stack = []

S.each_with_index do |c, i|
  if c =~ /[a-z]/
    # 気絶
    break if box[c]
    # 箱に追加
    box[c] = true
    stack.push(i)
  elsif c == "("
    stack.push(i)
  elsif c == ")"
    # 直前の ( までのjの値を探す
    j = stack.pop
    # ボールを取り出す
    S[j..i-1].each do |cc|
      box[cc] = false
    end
  end
end

# 箱が空ならYes
result = box.values.none? ? "Yes" : "No"
puts result
