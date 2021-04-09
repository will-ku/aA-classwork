
=begin
Given a list of integers find the smallest number in the list.

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
my_min(list)  # =>  -5

Phase I

First, write a function that compares each element to every other element of the q
list. Return the element if all other elements in the array are larger.
What is the time complexity for this function?
 
=end

def my_min(list)
    (0...list.length).each do |i| # n
        current = list[i] # 1
        rest_of_list = list[0...i] + list[i+1..-1] # 1
        return current if rest_of_list.all? {|num| num > current} # n
    end
end

# Big O = n ^ 2 because nested loop

=begin
Phase II

Now rewrite the function to iterate through the list just once while keeping 
track of the minimum. What is the time complexity?
=end

def my_min(list)
    min = list[0]
    list.each do |ele|
        min = ele if ele < min
    end
    min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

# Largest Contiguous Sub-sum

# def largest_contiguous_subsum(list)
#     outer_arr = []
#     (0...list.length).each do |i|
#         sub_arr = [list[i]]
#         outer_arr << sub_arr
#         new_arr = sub_arr.dup
#         (i+1...list.length).each do |j|
#             new_arr << list[j]
#             outer_arr << new_arr
#         end
#     end
#     p outer_arr
#     outer_arr.map! {|arr| arr.sum}
#     p outer_arr
#     return outer_arr.max.to_i
# end

#polynomial
# def largest_contiguous_subsum(list)
#     outer_arr = [] 

#     (0...list.length).each do |i| 
#         outer_arr << [list[i]]
#         (i+1...list.length).each do |j| 
#             outer_arr << list[i..j]
#         end
#     end
#
 #   
#     outer_arr.map! { |arr| arr.sum } 
#     outer_arr.max
# end 


def largest_contiguous_subsum(list)
    largest_sum = 0
    current = 0

    list.each.with_index do |num, i|
        current += num
        if  current > largest_sum
            largest_sum = current
        else
            current = 0
        end
    end

    largest_sum
end

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])


list = [5, 3, -7]
largest_contiguous_subsum(list) # => 8
    # # possible sub-sums
    # [5]           # => 5
    # [5, 3]        # => 8 --> we want this one
    # [5, 3, -7]    # => 1
    # [3]           # => 3
    # [3, -7]       # => -4
    # [-7]          # => -7
