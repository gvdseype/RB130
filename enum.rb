def compute(argument)
  default_answer = "Does not compute."
  if block_given?
    yield(argument)
  else
    argument
  end
end



puts compute(5) { |num| num + 1}
puts compute(5)



