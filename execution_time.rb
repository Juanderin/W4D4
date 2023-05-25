   #O(n^2)
   
   def my_min(arr) 
        min = arr.first 
        arr.each do |num1|
            arr.each do |num2|
                if num1 < min 
                    min = num1
                end 
                if num2 < min
                    min = num2 
                end 
            end 
        end 
        min
    end 


list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)  # =>  -5

#O(n)
def my_min1(arr)
    arr.inject {|acc,el| el < acc ? el : acc}
end


list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min1(list)  # =>  -5




#O(n^2)

def largest_contiguous_subsum(list)

    poss_coms = []

    (0...list.length).each do |i|
        (i...list.length).each do |j|
            poss_coms << list[i..j]
        end 
    end 

    poss_coms.inject {|acc,el| el.sum > acc.sum ? el : acc}.sum

end 


list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8

# possible sub-sums
# [5]           # => 5
# [5, 3]        # => 8 --> we want this one
# [5, 3, -7]    # => 1
# [3]           # => 3
# [3, -7]       # => -4
# [-7]          # => -7




def largest_contiguous_subsum1(list)

    max = 0 

    curr = 0 

    i = 0 

    until i == list.length

        curr += list[i] 
       max = curr if curr > max 
       curr = 0 if curr < 0 
       i += 1 
       
    end 

    max 

end 



# list = [5, 3, -7]
list = [-1,7,5,-1,8,-100,90]
p largest_contiguous_subsum1(list) # => 8
