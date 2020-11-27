def count(first, second, third)
  return count if ArgumentError
  array = [first, second, third]
  count = 0
  array.each { |num| count += 1 if yield(num) == true}
  count
end

puts count(1, 3, 6) { |value| value.odd? } == 2
puts count(1, 3, 6) { |value| value.even? } == 1
puts count(1, 3, 6) { |value| value > 6 } == 0
puts count(1, 3, 6) { |value| true } == 3
puts count() { |value| true } == 0
puts count(1, 3, 6) { |value| value - 6 } == 3