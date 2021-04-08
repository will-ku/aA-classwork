def my_uniq(arr)
    arr.uniq
end

class Array

    def two_sum
        indices = []
        (0...self.length).each do |i|
            (0...self.length).each do |j|
                indices << [i,j] if self[i] + self[j] == 0 && i < j
            end            
        end
        indices
    end
end

def my_transpose(arr)
    arr.transpose
end