#!/bin/env ruby

N = gets.chomp.to_i
A = gets.chomp.split.map(&:to_i)
# 系譜
genealogies = []
ameba = []

A.each_with_index { |a, i|
  # parent, child1, child2の順
  parent = a
  child1 = 2 * (i + 1)
  child2 = 2 * (i + 1) + 1

  if
    
  else

  end

  genealogy = LinkedList.new(parent)
  genealogies.push(genealogy.add_tail(child1))
  genealogies.push(genealogy.add_tail(child2))
}

[*1..(2 * N + 1)].times do |i|


end

########################
# 連結リスト
# ref. https://qiita.com/littlem/items/3028ee788ff77ebaaa5e
########################
class Node
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end

class LinkedList
  attr_reader :head

  def initialize(val)
    @head = Node.new(val)
  end

  def add_tail(val)
    node = search_tail(@head)
    node.next = Node.new(val)
  end

  private
  # 引数としてNodeを渡してそのNodeの次にNodeを連結させる
  # Nodeを追加することだけが責務
  def append_list(obj, val)
    obj.next = Node.new(val)
  end

  def search_tail(node)
    return node if !node.next
    search_tail(node.next)
  end
end
