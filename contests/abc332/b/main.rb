#!/usr/bin/env ruby
def main
  k, g, m = gets.chomp.split.map(&:to_i)
  glass = 0
  magcup = 0

  k.times do |i|
    # グラスがGmlのとき、グラスを空にする
    if glass == g
      glass = 0
    # マグカップがからの時、マグカップを水で満たす
    elsif magcup == 0
      magcup = m
    else
      # マグカップが空になるか、グラスが満タンになるまで水を注ぐ
      if magcup <= g - glass
        glass += magcup
        magcup = 0
      else
        magcup -= g - glass
        glass = g
      end
    end
  end

  puts "#{glass} #{magcup}"
end

main
