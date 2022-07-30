#!/usr/bin/env ruby

# N = gets.chomp.to_i
# S = gets.chomp
N = "3".chomp.to_i
S = "BBA".chomp

chars = S.chars
chars_reverse = chars.reverse

if chars == chars_reverse
  puts "Yes"
  exit
end

puts "chars: #{chars.join}"
puts "chars_r: #{chars_reverse.join}"

for i in 0..N-1
  puts "#{i}回目"
  if (chars[i] != chars_reverse[i]) && i != N-1
    if chars_reverse[i] == "B" && i != 0
      pp chars[-i-1], chars[-i]
      chars[-i-1], chars[-i] = "A", "B"
    elsif chars_reverse[i] == "A" && i != N-1
      pp chars[-i-1-2], chars[-i-1]
      chars[-i-1-2], chars[-i-1] = "A", "B"
    end

    chars_reverse = chars.reverse

    puts "chars: #{chars.join}"
    puts "chars_r: #{chars_reverse.join}"
    if (chars[i] == chars_reverse[i]) && (chars[i-1] == chars_reverse[i-1])
      next
    else
      break
    end
  end
end

chars == chars_reverse ? result = "Yes" : result = "No"
puts result
