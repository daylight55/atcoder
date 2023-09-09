#!/usr/bin/env ruby
def main
  n, m = gets.chomp.split.map(&:to_i)
  sellers = gets.chomp.split.map(&:to_i)
  buyers = gets.chomp.split.map(&:to_i)

  seller_count = sellers.tally.sort_by { |k, v| k }
  buyer_count = buyers.tally.sort_by { |k, v| k }

  left = seller_count[0][0]
  right = buyer_count[-1][0]

  while left < right
    mid = (left + right) / 2
    # midで売れる売り手の人数を求める
    seller_num = seller_count.select { |k, v| k <= mid }.values.sum
    # midで買える買い手の人数を求める
    buyer_num = buyer_count.select { |k, v| k >= mid }.values.sum
    if seller_num >= buyer_num
      right = mid
    else
      left = mid + 1
    end

    puts left
  end
end

main
