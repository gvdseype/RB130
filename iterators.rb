def step(start, final, addition)
  array = []
  count = start
  loop do 
    break if count > final
    array << count
    count += addition
  end
  array.each { |num| yield(num)}
end

step(1, 10, 3) { |value| puts "value = #{value}" }
