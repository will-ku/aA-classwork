def anagrams(str1, str2)
  if (str1.length != str2.length)
    return false
  end

  array = Array.new(26, 0)
  aByte = "a".ord  # = 97

  str1.split("").each do |c|    
    array[c.ord - aByte] += 1  
  end

  str2.split("").each do |c|
    if (array[c.ord - aByte] == 0)  
      return false 
    end

    array[c.ord - aByte] -= 1
  end

  return !array.find { |a| a != 0 }
end