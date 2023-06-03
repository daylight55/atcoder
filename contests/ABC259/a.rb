#!/usr/bin/env ruby

N, M, X, T, D = gets.split(" ").map(&:to_i)
tall = 1

if M == 0
  if M < N
    tall = T - D * (X - M)
  end
elsif X < M
  for _i in 1..X do
    tall = T
  end
else
  if M < N
    tall = T - D * (X - M)
  else
    for _i in 1..X do
      tall += D
    end
  end
end

puts tall
