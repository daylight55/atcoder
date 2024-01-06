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
    prev = head.dup
    case b
    when "R" then head[0] += 1
    when "L" then head[0] -= 1
    when "U" then head[1] -= 1
    when "D" then head[1] += 1
    end
    head_history << head.dup
    (2..n).each do |i|
      current = pos[i].dup
      pos[i] = prev
      prev = current
    end
  when "2"
    part = b.to_i
    # 頭のときはそのまま返す
    if part == "1"
      puts "#{head[0]} #{head[1]}"
    else
      if part <= head_history.size
        position = head_history[-part]
        puts "#{position[0]} #{position[1]}"
      else

      end

    end
  end
end
