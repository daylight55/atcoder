N = gets.chomp.to_i
S = gets.chomp.chars

# SはRLUDの文字列がN個入っている
# N回の移動の間に(0, 0)から移動する高橋くんが一度でも同じ座標にいたことがあるかを判定する
def judge(s)
  x = 0
  y = 0
  visit = Hash.new(0)
  visit[[x, y]] += 1

  s.each do |c|
    case c
    when 'R'
      x += 1
    when 'L'
      x -= 1
    when 'U'
      y += 1
    when 'D'
      y -= 1
    end
    visit[[x, y]] += 1
    return 'Yes' if visit[[x, y]] > 1
  end
  'No'
end

puts judge(S)
