N, M = gets.chomp.split.map(&:to_i)
S = Array.new(N){ gets.chomp.chars.map{ |s| s == "o" ? 1 : 0 } }
count = 0

for i in 0..(N-1) do
  # 組み合わせ
  for j in (i+1)..(N-1) do
    result = S[i].zip(S[j]).map{|a, b| a + b}
    count += 1 if result.all?{ |x| x >= 1}
  end
end

puts count
