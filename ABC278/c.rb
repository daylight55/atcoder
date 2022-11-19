n, q = gets.chomp.split.map(&:to_i)
class User
  @follow = []

  def initialize(id)
    @id = id
  end

  def follow(id)
    @follow.append(id)
  end

  def unfollow(id)
    @follow.delete(id)
  end
end

Users = []
n.times { |i| Users.append(User.new(i)) }

t = Array.new(n)
a = Array.new(n)
b = Array.new(n)

q.times { |i|
  t[i], a[i], b[i] = gets.chomp.split.map(&:to_i)
}
