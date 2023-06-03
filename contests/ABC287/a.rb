N = gets.chomp.to_i
S = Array.new(N){ gets.chomp }

for_num = 0
S.each_with_index do |s, i|
  if s == "For"
    for_num += 1
  end
end

if for_num > N / 2
  puts "Yes"
else
  puts "No"
end
