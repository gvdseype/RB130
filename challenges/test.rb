def reduce(array)
  counter = 0
  result = []

  while counter < array.size
    temp_str = ''
    result = yield(temp_str, array[0][counter])
    counter += 1
  end
  result
end

reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value }

