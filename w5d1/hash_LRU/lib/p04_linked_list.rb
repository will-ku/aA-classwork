class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    next_node = self.next
    prev_node = self.prev
    next_node.prev = self.prev
    prev_node.next = self.next
    self.next = nil
    self.prev = nil
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  attr_reader :tail, :head
  include Enumerable

  def initialize
    @head = Node.new(:head,true)
    @tail = Node.new(:tail,true)
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
  end

  def last
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    node = Node.new(key,val)
    last_node = tail.prev  #tail's previous (2nd to last)
    last_node.next = node # 2nd to last's next (aka current)
    node.prev = last_node
    node.next = tail
    tail.prev = node
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
