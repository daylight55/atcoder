#!/usr/bin/env ruby
def main
  n, m = gets.chomp.split.map(&:to_i)
  input = Array.new(n) { gets.chomp.split.map(&:to_i) }

  result = false
  n.times do |i|
    # targetの製品
    p, c = input[i][0], input[i][1]
    f = input[i][2..-1]

    # 価格がtarget以下の製品のみを抽出
    condition = input.select{|x| x[0] <= p}
    # 結果がnilなら次へ
    next if condition.nil?

    # targetが持つ機能数よりも多い機能を持つ製品
    condition = condition.select{|x| x[1] >= c}
    # 結果がnilなら次へ
    next if condition.nil?

    # 価格が未満であるか
    condition_price = condition.select{|x| x[0] < p}
    # i番目の製品にない機能を1つ以上持つ製品
    condition_func = condition.select{|x| x[2..-1].any?{|y| !f.include?(y)}}

    # 最後の条件のいずれかが存在していたらtrue
    puts "i: #{i} / p: #{p} / c: #{c} / f: #{f}"
    puts "condition_price: #{condition_price}"
    puts "condition_func: #{condition_func}"

    result = true if !condition_price.nil? || !condition_func.nil?
  end

  puts result ? 'Yes' : 'No'
end

# ---------------------------------------------------
# 以下、自前ライブラリ
class Array
  # ref. https://stackoverflow.com/questions/1475808/cumulative-array-sum-in-ruby
  def cumulative_sum
    sum = 0
    self.map{|x| sum += x}.unshift(0) # 頭に0を追加しておく
  end
end

main
