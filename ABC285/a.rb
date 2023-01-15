a, b = gets.chomp.split.map(&:to_i)

diff = (a - b).abs

if (diff == a) | (diff == a + 1)
  puts "Yes"
else
  puts "No"
end
