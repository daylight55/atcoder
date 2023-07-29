#!/usr/bin/env ruby
def main
  n, m = gets.chomp.split.map(&:to_i)
  sellers = gets.chomp.split.map(&:to_i)
  buyers = gets.chomp.split.map(&:to_i)

  sellers.sort!
  buyers.sort!

  prices = []
  

  selllers_uniq.each_index do |price, i|
    # priceで売れる売り手の人数を求める
    seller_num = sellers.count { |seller| price >= seller }
    # priceの買い手の人数を求める
    buyer_num = buyers.count { |buyer| buyer >= price }
    # priceで売れる売り手の人数が、priceの買い手の人数以上である場合、priceをcountsに追加する
    prices << price if seller_num >= buyer_num
  end

  # countsの最小値を出力する
  puts prices.min
end

main
