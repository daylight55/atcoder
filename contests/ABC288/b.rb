N, K = gets.chomp.split.map(&:to_i)
S = Array.new(N){ gets.chomp }

ans = S.slice(0, K).sort
puts ans
