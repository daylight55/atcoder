def good_subsequence?(a, l, r, k)
  sum = Array.new(a.size + 1, 0)
  (1..a.size).each { |i| sum[i] = sum[i - 1] + a[i - 1] }
  (l..r - k + 1).each do |i|
    diff = sum[i + k - 1] - sum[i - 1]
    return false if diff != 0 && diff % k != 0
  end
  true
end

n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
q = gets.to_i
q.times do
  l, r = gets.split.map(&:to_i)
  puts good_subsequence?(a, l, r, k) ? 'Yes' : 'No'
end
