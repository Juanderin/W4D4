
#O(n^2)
def windowed_max_range(arr, size) 

    max_range = nil 

    (0..arr.length-size).each do |i|
        sub = arr[i...i + size] 
        range = sub.max - sub.min
        max_range = range if max_range.nil? 
        max_range = max_range > range ? max_range : range
    end

    max_range
        
    
end 

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8


class MyQueue

    def initialize 

        @store = []

    end 

    def peek 

        @store.last 

    end 

    def size 

        @store.size 

    end

    def empty?

        @store.empty?

    end

    def enqueue(ele)

        @store.push(ele)

    end 

    def dequeue(ele)

        @store.shift

    end




end


class MyStack 

    def initialize

        @store = []

    end 


    def pop
        @store.pop
    end

    def push(ele)

        @store.push(ele)
    end


    def peek

        @store.last 

    end

    def size 

        @store.size 

    end


    def empty?

        @store.empty?

    end

end 

class StackQueue < MyStack

    def initialize
        super
        @stack1 = MyStack.new
        @stack2 = MyStack.new
    end


    def enqueue(ele)

        @stack1.push(ele)

    end 

    def dequeue
        until @stack1.empty?
            @stack2.push(@stack1.pop)
        end
        @stack2.pop
        until @stack2.empty?
            @stack1.push(@stack2.pop)
        end
    end




end 


class MinMaxStack < MyStack

    def initialize
        super

    
        @max = nil
        @min = nil

    end

    def pop
        @max = peek[:max]
        @min = peek[:min]
        super
    end

    def push(ele)

        super({value: ele, min: @min, max: @max})
        @max = ele if (ele > @max) || @max.nil?
        @min = ele if (ele < @min) || @min.nil?
    end
end

class MinMaxStackQueue < MinMaxStack
    def initialize
        super
        @stack1 = MyStack.new
        @stack2 = MyStack.new
    end


    def enqueue(ele)

        @stack1.push(ele)

    end 

    def dequeue
        until @stack1.empty?
            @stack2.push(@stack1.pop)
        end
        @stack2.pop
        until @stack2.empty?
            @stack1.push(@stack2.pop)
        end
    end
end