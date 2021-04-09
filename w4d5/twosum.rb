def bad_two_sum?(arr, target_sum)
    arr.each_with_index do |num1,i|
        arr.each_with_index do |num2,j|
            sum = num1 + num2 if i != j
            return true if sum == target_sum
        end
    end
    false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false
