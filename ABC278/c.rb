require 'set'

n, q = gets.chomp.split.map(&:to_i)

T = Array.new(q)
A = Array.new(q)
B = Array.new(q)
q.times { |i|
  T[i], A[i], B[i] = gets.chomp.split.map(&:to_i)
}

class User
  def initialize(id)
    @id = id
    @follow_list = Set.new
  end

  def follow(id)
    @follow_list.add(id)
  end

  def unfollow(id)
    @follow_list.delete(id)
  end

  def include_follow_list?(id)
    @follow_list.include?(id)
  end
end

Users = []
n.times { |i| Users.append(User.new(i)) }

q.times { |i|
  t, a, b = T[i], A[i] - 1, B[i] - 1

  if t == 1
    Users[a].follow(b)
  elsif t == 2
    Users[a].unfollow(b)
  elsif t == 3
    if Users[a].include_follow_list?(b) and Users[b].include_follow_list?(a)
      puts "Yes"
    else
      puts "No"
    end
  end
}
