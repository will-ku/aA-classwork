def bad_two_sum?(arr, target_sum)
    arr.each_with_index do |num1,i|
        arr.each_with_index do |num2,j|
            sum = num1 + num2 if i != j
            return true if sum == target_sum
        end
    end
    false
end


def okay_two_sum?(arr, target)
    arr.sort!
    mid = arr.length/2
    side1 = arr.take(mid) # [0, 1]
    side2 = arr.drop(mid) #[5, 7, 8]

    # current = arr.first

    # (1...arr.length).each do |i|
    #     current += arr[i]
    #     return true if target == current
    #     current = arr[i]
    # end

end

arr = [1, 2, 7, 5]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false
