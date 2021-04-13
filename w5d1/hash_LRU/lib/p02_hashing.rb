class Integer
  # Integer#hash already implemented for you
end
               
BITWISE_HASH = 1010010101
class Array
  def hash
    a = self.join("1").to_i.to_s(2).to_i
    #[123] => "112131" => 123 => "111011" => 111011 
    a ^ BITWISE_HASH
  end
end

class String
  def hash
    alpha = ("a".."z").to_a 
    alpha_indices = []
    self.each_char {|char| alpha_indices << alpha.index(char)}
    alpha_indices = alpha_indices.join("1").to_i.to_s(2).to_i
    alpha_indices ^ BITWISE_HASH
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    arr_of_strings = self.sort.flatten.map {|el| el.to_s}
    arr_of_strings.join("").hash
    # 0
  end
end
