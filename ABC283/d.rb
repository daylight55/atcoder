S = gets.chomp.chars

# 入れ子の括弧の中身をグループ化
# その組みの中に重複する文字があればその時点でアウト
# それ以外ならスルーして最後までチェックで終わり

box = []
# 一回愚直にやってみる
S.each_with_index{ |s, i|
  case s

  when "(" then
    next
  when ")" then
    # jを探索
    delete_list = S.slice(i, j)
    box = box - delete_list
  else
    box << s
  end

}
