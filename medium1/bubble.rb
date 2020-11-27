def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if array[index - 1] <= array[index]
      if block_given?
        if yield(array[index-1], array[index])
          array[index - 1], array[index] = array[index], array[index - 1]
        else
          next
        end
      else
        array[index - 1], array[index] = array[index], array[index - 1]
      end
      swapped = true
    end

    break unless swapped
  end
  nil
end

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
puts array
