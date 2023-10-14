def main
  n, m = gets.chomp.split.map(&:to_i)
  a = gets.chomp.split.map(&:to_i)

  calendar = Array.new(n + 1, n + 1)
  a.each do |ai|
    calendar[ai] = 0
  end

  (n - 1).downto(1) do |i|
    calendar[i] = [calendar[i], calendar[i + 1] + 1].min
  end

  (1..n).each do |i|
    puts calendar[i]
  end
end

main
