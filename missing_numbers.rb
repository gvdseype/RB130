def missing(array)
  missing_numbers = []
  (array[0]..array[-1]).to_a.each do |num|
    if array.include?(num)
      next
    else
      missing_numbers.push(num)
    end
  end
  missing_numbers
end

p missing([-3, -2, 1, 5])