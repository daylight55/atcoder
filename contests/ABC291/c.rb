N = gets.chomp.to_i
S = gets.chomp.chars

def solve(s)
  x = 0
  y = 0
  # ハッシュマップで座標をキーに使用
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
    # 2回訪問
    return 'Yes' if visit[[x, y]] > 1
  end
  'No'
end

puts solve(S)
