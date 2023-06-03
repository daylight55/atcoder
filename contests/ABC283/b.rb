N = gets.chomp.to_i
A = gets.chomp.split.map(&:to_i)
Q = gets.chomp.to_i
queries = Array.new(Q){ gets.chomp.split.map(&:to_i) }

queries.each_with_index{ |query|
  option = query[0]
  k = query[1] - 1

  if option == 1
    x = query[2]
    A[k] = x
  elsif option == 2
    puts A[k]
  end
}
