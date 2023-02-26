N = gets.chomp.to_i
X = gets.chomp.split.map(&:to_i)

def solve(x, n)
  x.sort!
  n.times do
    x.shift
    x.pop
  end
  x.sum / x.length.to_f
end

puts solve(X, N)
