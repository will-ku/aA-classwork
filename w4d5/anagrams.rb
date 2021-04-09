# Anagrams

# Our goal today is to write a method that determines if two given words are anagrams. 
# This means that the letters in one word can be rearranged to form the other word. 
# For example:

# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true
# Assume that there is no whitespace or punctuation in the given strings.

# def first_anagram?(str1,str2)
#     arr = []

#     (0...str1.length).each do |i|
#         (i...str1.length).each do |j|
#             arr << str1[i..j]
#         end
#     end
#     possible_ana = []
#     arr.each do |anagram|
#         possible_ana << anagram if str2.include?(anagram)
#     end
#     possible_ana
# end
    
def first_anagram?(str1,str2)
    hash = Hash.new(0)

    str1.each_char do |char|
        hash[char] += 1
    end

    str2.each_char do |char|
        hash[char] -= 1
    end

    hash.all? {|k,v| v == 0}

end
    
# p first_anagram?("gizmo", "sally")    #=> false

def second_anagram(str1, str2)
    str2 = str2.split('')
    
    str1.each_char do |char|
        idx = str2.find_index(char)
        str2.delete_at(idx)
    end
    
    str2.empty?
end

p second_anagram("elvis", "lives")    #=> true