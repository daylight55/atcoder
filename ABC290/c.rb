require 'set'

n, k = gets.chomp.split.map(&:to_i)
a = gets.chomp.split.map(&:to_i).to_set

k.times do |i|
  if !a.include?(i)
    puts i
    exit
  end
end
puts k
