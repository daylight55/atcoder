n, q = gets.chomp.split.map(&:to_i)
query = Array.new(q) { gets.chomp.split }

pos = {}
(1..n).each do |i|
  pos[i] = [i, 0]
end
head = pos[1]
head_history = []

query.each do |a, b|
  case a
  when "1"
    case b
    when "R" then head[0] += 1
    when "L" then head[0] -= 1
    when "U" then head[1] -= 1
    when "D" then head[1] += 1
    end
    head_history << head.dup
  when "2"
    # 頭のときはそのまま返す
    if b == "1"
      puts "#{head[0]} #{head[1]}"
      next
    end
    # 頭以外のときは、パーツの位置を計算する
    # 頭の移動した
    if head_history.size < b.to_i
  end
end
