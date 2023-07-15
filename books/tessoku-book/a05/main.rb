N, K = gets.chomp.split.map(&:to_i)

count = 0
(1..N).each do |i|
  (1..N).each do |j|
    z = K - i - j
    count += 1 if z >= 1 && z <= N
  end
end

puts count
