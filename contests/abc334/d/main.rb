N, Q = gets.split.map(&:to_i)
R = gets.split.map(&:to_i)
query = Array.new(Q) { gets.chomp.to_i }

class Array
  # ref. https://stackoverflow.com/questions/1475808/cumulative-array-sum-in-ruby
  def cumulative_sum
    sum = 0
    self.map{|x| sum += x}.unshift(0) # 頭に0を追加しておく
  end
end

# https://akhtikd.com/posts/2019-12-11/
def lower_bound(arr, n)
  ng = -1
  ok = arr.size
  while (ok - ng).abs > 1
    mid = (ok + ng) / 2
    if n <= arr[mid]
      ok = mid
    else
      ng = mid
    end
  end
  ok
end

culmulatives = R.sort.cumulative_sum
pp culmulatives

query.each do |q|
  # ans = culmulatives.bsearch_index { |x| x <= q } || 0
  ans = lower_bound(culmulatives, q)

  puts ans
end
