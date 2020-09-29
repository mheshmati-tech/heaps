require_relative "./min_heap"

# This method uses a heap to sort an array.
# Time Complexity:  O n(log n)
# Space Complexity: O(n) returning_array + internal heap array = O(2n) = O(n)?
def heapsort(list)
  heap = MinHeap.new

  #make the minheap tree 
  list.each do |item|
    #add method will sort as adding item to heap
    heap.add(item)
  end

  returning_list = []
  (list.length).times do |i|
    #remove method will pop/return the root aka smallest value 
    returning_list << heap.remove
  end
  return returning_list
end