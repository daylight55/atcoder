#!/usr/bin/env ruby
P, Q = gets.chomp.split

distances = {
  "AB" => 3,
  "BC" => 1,
  "CD" => 4,
  "DE" => 1,
  "EF" => 5,
  "FG" => 9
}

if P > Q
  tmp = P
  P = Q
  Q = tmp
end

sum = 0
(P...Q).each do |alphabet|
  # puts "alphabet: #{alphabet}"
  # puts "alphabet.next: #{alphabet.next}"
  sum += distances[alphabet + (alphabet.next)]
end

puts sum
