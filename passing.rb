items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end


# gather(items) do |*first_three, fourth|
#   puts "#{first_three.join(', ')}"
#   puts "#{fourth}"
# end


# gather(items) do | apples, *two , wheat|
#   puts "#{apples}"
#   puts "#{two.join(', ')}"
#   puts "#{wheat}"
# end

# gather(items) do | first, *last_three|
#   puts "#{first}"
#   puts "#{last_three.join(', ')}"
# end

gather(items) do |first, second, third, fourth|
  puts "#{first}, #{second}, #{third}, #{fourth}"
end