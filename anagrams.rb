# def first_anagram(word)
#     return [word] if word.length <= 1
#     anagrams = []
#     (0...word.length).each do |i|
#         first_anagram(word[0...i]+word[i+1..-1]).each do |string|
#             anagrams << word[i] + string
#         end
#     end
#     anagrams
# end

# def anagram?(word1,word2)
#     first_anagram(word1).include?(word2)
# end
# p first_anagram("gizmo")
# p anagram?("gizmo", "sally")    #=> false
# p anagram?("elvis", "lives")    #=> true


# def second_anagram?(word1, word2)

#     letters2 = word2.chars 

#     word1.each_char do |char|
#         if letters2.include?(char)
#             del = letters2.index(char)
#             letters2.delete_at(del)
#         end
#     end 

#     letters2.empty?

# end


#O(n log(n))
def third_anagram?(word1,word2)
    letters1 = merge_sort(word1.chars)
    letters2 = merge_sort(word2.chars)
    letters1 == letters2
end

def merge_sort(arr)
    return arr if arr.length <= 1
    mid = (arr.length / 2)

    left = arr.take(mid)
    right = arr.drop(mid)

    merge_alpha(merge_sort(left),merge_sort(right))
end
def merge_alpha(left,right)
    merged = []
    alpha = ("a".."z").to_a
    until left.empty? || right.empty?
        if alpha.index(left[0]) < alpha.index(right[0])
            merged << left.shift
        else
            merged << right.shift
        end
    end
    merged + left + right
end


def fourth_anagram?(word1,word2)
    hash = Hash.new(0)
    word1.each_char {|char| hash[char] += 1}
    word2.each_char {|char| hash[char] -= 1}
    hash.values.uniq == [0]

end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true