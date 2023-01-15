N = gets.chomp.to_i
S = gets.chomp.chars

l = 0
for i in 1..N-1 do
  for j in 0..N-i-1 do
    if S[j] != S[j + i]
      l += 1
    else
      break
    end
  end
  # puts "i:#{i} j:#{j} l:#{l}"
  puts l
  l = 0
end
