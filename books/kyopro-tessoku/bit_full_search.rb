"""
P.39 A05 Three Cargs
"""
N, K = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)

ans = false
(0..(2**N-1)).each{ |i|
  sum = 0
  (0..N).each{ |j|
    sum += A[j] if i[j] == 1
  }
  if sum == K
    ans = true
    break
  end
}

result = ans ? "Yes" : "No"
puts result
