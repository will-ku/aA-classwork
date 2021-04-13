class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if num_buckets == count
      resize!
    end

    modded = key.hash % num_buckets

    if !include?(key) 
      self[modded] << key
      @count += 1
    end
  end

  def include?(key)
    modded = key.hash % num_buckets
    self[modded].include?(key)
  end

  def remove(key)
    modded = key.hash % num_buckets
    if include?(key)
      self[modded].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    @num_buckets = num_buckets * 2
    temp = Array.new(@num_buckets) {[]}
    @store.each do |bucket|
      bucket.each do |el| 
        new_bucket = el.hash % @num_buckets
        temp[new_bucket] << el
      end
    end
    @store = temp
  end
end
