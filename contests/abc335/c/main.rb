n, q = gets.chomp.split.map(&:to_i)
query = Array.new(q) { gets.chomp.split }
pos = []
(1..n).each do | i |
  pos << [i, 0]
end

query.each do | type, command |
  case type
  when '1'
    pos.pop
    head = pos.first.dup
    case command
    when "R" then head[0] += 1
    when "L" then head[0] -= 1
    when "U" then head[1] += 1
    when "D" then head[1] -= 1
    end
    pos.unshift(head)
  when '2'
    puts pos[command.to_i - 1].join(' ')
  end
end
