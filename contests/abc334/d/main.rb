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

culmulatives = R.sort.cumulative_sum

query.each do |q|
  index = culmulatives.bsearch_index { |x| x > q }
  if index.nil?
    ans = N
  else
    ans = index - 1
  end

  puts ans
end
