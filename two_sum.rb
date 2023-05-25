
#O(n^2)
def two_sum?(arr, target)


    arr.each.with_index do |ele1, idx1|
        arr.each.with_index do |ele2, idx2|
            if ele1 + ele2 == target && idx2 > idx1 
                return true 
            end 
        end 
    end 

    return false


end 


def okay_two_sum?(arr,target_sum)
    sorted = merge_sort(arr)
    sorted.each_with_index do |el,i|
        j = bsearch(sorted,target_sum-el)
        return true if !j.nil? && i != j
    end
    return false
end 

def merge_sort(arr,&prc)
    return arr if arr.length <= 1
    prc ||= proc {|a,b| a<=>b}
    mid = (arr.length / 2)

    left = arr.take(mid)
    right = arr.drop(mid)

    merge_alpha(merge_sort(left,&prc),merge_sort(right,&prc),&prc)
end
def merge_alpha(left,right,&prc)
    merged = []
    until left.empty? || right.empty?
        if prc.call(left[0],right[0]) == -1
            merged << left.shift
        else
            merged << right.shift
        end
    end
    merged + left + right
end

def bsearch(arr, target)

    mid = (arr.length / 2)
    return mid if arr[mid] == target 


    case target <=> arr[mid]
    when -1 
        bsearch(arr.take(mid), target)
    when 0 
        mid 
    when 1 
        rs = bsearch(arr.drop(mid + 1), target)
        if rs.nil?
            return nil 
        else 
            rs + mid + 1 
        end 
    end 

end 

def 


arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false


def two_sum_hash?(arr,target_sum)
    hash = Hash.new(0)
    arr.each_with_index do |el,i|
        return true if hash.has_key?(el) 
        hash[target_sum-el] = i
    end
    return false
end



arr = [1, 5, 7]
p two_sum_hash?(arr, 6) # => should be true
p two_sum_hash?(arr, 10) # => should be false