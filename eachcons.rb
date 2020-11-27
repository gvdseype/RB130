def each_cons(array)
  hash = {}
  index1 = 0
  index2 = 1
  array.each do |n|
    hash[array[index1]] = array[index2]
    index1 += 1
    index2 += 1
    break if index1 == array.size - 1
  end
  puts hash
end

each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
