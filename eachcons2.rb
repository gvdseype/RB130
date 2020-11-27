
def each_cons(array, number)
  hash = {}
  array.each_with_index do |num, index|
    yield(num, [index + 1..index + 1 + number )
  end
  p hash
end


each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end

#use previos eachcons to solve this