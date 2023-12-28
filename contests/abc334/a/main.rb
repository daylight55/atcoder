b, g = gets.chomp.split(' ').map(&:to_i)
if b > g
  puts 'Bat'
else
  puts 'Glove'
end
