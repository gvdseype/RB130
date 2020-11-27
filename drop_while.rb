def drop_while(array)
  result = []
  counter = 0
  stop_counter = nil
  if yield(array[0]) == true
    array.each { |num| result << num if yield(num) == false}
  elsif yield(array[0]) == false
    loop do 
      if yield(array[counter]) == true
        result << array[counter]
        break
      end
      break if counter == array.size
      result << array[counter]

      counter += 1
    end
  end
  p result

end


puts drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
puts "------------"
puts drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
puts "------------"
puts drop_while([1, 3, 5, 6]) { |value| true } == []
puts "------------"
puts drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
puts "------------"
puts drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
puts "------------"
puts drop_while([]) { |value| true } == []
puts "------------"