require 'set'

N, Q = gets.chomp.split.map(&:to_i)
E = Array.new(Q) { gets.chomp.split.map(&:to_i) }

uncalled = Set.new(1..N).to_a
called = []

E.each { |e|
  # 受付に呼ばれていない人のうち、最も小さい番号の人が受付に呼ばれる。
  if e[0] == 1
    uncalled_min = uncalled.min
    called << uncalled_min
    uncalled.delete(uncalled_min)
  # 人x が初めて受付に行く。(ここで、人x はすでに 1 回以上受付に呼ばれている。)
  elsif e[0] == 2

    called.delete(e[1])
  # すでに受付に呼ばれているが受付に行っていない人のうち、最も小さい番号の人が再度呼ばれる。
  elsif e[0] == 3
    
    puts called.first if called.first
    called.shift
  end
  # puts "called: #{called.join(' ')}"
}
