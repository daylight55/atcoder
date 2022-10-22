#!/bin/env ruby

N = gets.chomp.to_i
A = gets.chomp.split.map(&:to_i)
# 系譜
genealogies = Hash.new { |h,k| h[k] = {} }

A.each_with_index { |a, i|
  # parent, child1, child2の順
  genealogies[i]["parent"] = a
  genealogies[i]["child"] = [2*(i + 1), 2*(i + 1) + 1]
}

ans = Array(2 * N + 1)


genealogies.each{ |genealogy|

  puts parent
}


########################
# 連結リスト
########################
class List
  class Cell
    attr_accessor :val
    attr_accessor :next

    def initialize(val = nil)
      @val = val
      @next = nil
    end
  end

  def initialize()
    @num = 0
    @head = nil
    @tail = @head
  end

  def push(val)
    if @head.nil?
      @tail = @head = Cell.new(val)
    else
      @tail.next = Cell.new(val)
      @tail = @tail.next
    end

    @num += 1
  end

  def to_a()
    arr = Array.new(@num)

    i = 0
    cell = @head
    while cell
      arr[i] = cell.val
      cell = cell.next
      i += 1
    end

    return arr
  end
end
