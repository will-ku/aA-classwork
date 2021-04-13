class MaxIntSet
  attr_accessor :store 

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise 'Out of bounds' unless is_valid?(num) 
    store[num] = true 
  end

  def remove(num)
    store[num] = false 
  end

  def include?(num)
    store[num] == true 
  end

  private

  def is_valid?(num)
    num.between?(0, store.length-1)
  end

  def validate!(num)
  end
end


class IntSet
 
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num) #3 [3][3]
    self[num] << num 
    #same as store[num%num_buckets][num] = true
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private
   attr_accessor :store

  def [](num)
   store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if count == num_buckets
    if !include?(num) 
      self[num] << num 
      @count += 1
    end
  end
    
  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end 
  end

  def include?(num)
    self[num].include?(num)
  end

  private
  attr_accessor :store

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    store[num % num_buckets]
  end


  def num_buckets
    @store.length
  end

  def resize!
    @num_buckets = num_buckets * 2
    temp = Array.new(@num_buckets) {[]}
    store.each do |bucket|
      bucket.each do |el| 
        new_bucket = el % @num_buckets
        temp[new_bucket] << el
      end
    end
    @store = temp
  end
end
