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

def stock_picker(arr)
    days = []
    max_difference = 0

    (0...arr.length).each do |buy_date|
        (0...arr.length).each do |sell_date|
            if sell_date > buy_date && (arr[sell_date]-arr[buy_date] > max_difference)
                days = [buy_date, sell_date]
                max_difference = arr[sell_date]-arr[buy_date]
            end
        end
    end
    days
end

# p stock_picker([1, 2, 6, 4, 5])


def towers_of_hanoi


end

def move(arr1, arr2)
    if arr2[-1] < arr1[-1]
        arr1.push(arr2.pop)
    else
        raise "invalid move"
    end
    [arr1, arr2]
end

#move
    #push and pop and check if arr[-1] < disc
    #arr1 = [4, 3, 2]
    #arr2 = []
    # return [arr1, arr2]

#won
    #checks to see if all discs are stacked in the right order