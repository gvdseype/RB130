# starting from -1, multiply the number by the 
# 1
multiplier = 1
numbers_array = 1990.to_s.split('')
index = numbers_array.size - 1
array = []
loop do 
  break if index < 0
  array << numbers_array[index].to_i * multiplier
  multiplier *= 10
  index -= 1
end
array = array.reverse



900




