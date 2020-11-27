def max_by(array)
  return nil if array.empty?
  
  highest_contributor = 0
  last_highest_score = yield(array[0])
  
  array.each do |num|
    
    if yield(num) > yield(last_highest_score) 
      highest_contributor = num
      last_highest_score = yield(num)
    end
  end
  highest_contributor
end


# puts max_by([1, 5, 3]) { |value| value + 2 } 
# puts max_by([1, 5, 3]) { |value| 9 - value } 
# puts max_by([1, 5, 3]) { |value| (96 - value).chr } 
puts max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } 
# puts max_by([-7]) { |value| value * 3 } 
# puts max_by([]) { |value| value + 5 } 