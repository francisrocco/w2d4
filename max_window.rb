def windowed_max_range(arr,window_size)
  max_range = 0

  arr.each_with_index do |el, idx|
    break if window_size + idx > arr.count
    window_array = arr[idx...idx+window_size]
    win_dif = window_array.max - window_array.min
    max_range = win_dif if max_range < win_dif
  end

  max_range

end


class MyQueue

  def initialize
    @store = []
  end

  def enqueue(el)
    @store.unshift(el)
  end

  def dequeue(el)
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.length == 0
  end

end


class MyStack

  def initialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push
    @store.push
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.length == 0
  end

end

class StackQueue

  def initialize
    @store = MyStack.new
  end

  def enqueue(el)
    @store.push(el)
  end

  def flip
    @temp_stack = MyStack.new
    @temp_stack.enqueue(@store.pop) until @store.empty?
    @store = @temp_stack
  end

  def dequeue
    flip
    dequeued_el = @store.pop
    flip
    dequeued_el
  end


    def size
      @store.length
    end

    def empty?
      @store.length == 0
    end


end
