class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap
  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(1)
  # Space Complexity: O(log n)
  def add(key, value = key)
    @store << HeapNode.new(key, value)

    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(1)
  # Space Complexity: O(log n)
  def remove()
    if @store.empty?
      return nil 
    end
    
    #removing the root element 
    swap(0, @store.length - 1)
    result = @store.pop

    #re-arranging heap 
    heap_down(0) unless @store.empty?
    return result.value 
  end

  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"

    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(1)
  # Space complexity: O(log n)
  def heap_up(index)
    parent = (index - 1) / 2
    return if index == 0

    if @store[parent].key > @store[index].key
      swap(parent, index)
      heap_up(parent)
    else #if @store[parent].key < @store[index].key
      return
    end
  end

  # This helper method takes an index and
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    right = 2 * index + 2
    left = 2 * index + 1
    return if left >= @store.length #return if no child exists 

    #initilize smaller in case right index doesn't exist 
    smaller = left 
    #determine which is smaller 
    if @store[right]
      smaller = @store[left].key > @store[right].key ? right : left
    end 

    #swap 
    if @store[smaller].key < @store[index].key
      swap(smaller, index)
      heap_down(smaller)
    else #if @store[smaller].key > @store[index].key
      return 
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
