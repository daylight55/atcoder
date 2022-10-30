STRAWBERRY=1
WATER_MELON=2
PUMPKIN=3

candy_list = gets.chomp.split.map(&:to_i)

box = Array.new(10, Array.new(10, 0))
(1..100).each do |i|
  insert_index = gets.chomp.to_i

  rot = rand(1..3)
  output = ""
  if rot == 1
    output = "R"
  elsif rot == 2
    output = "B"
  elsif rot == 3
    output = "L"
  end
  puts output
  STDOUT.flush
end
