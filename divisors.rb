def divisors(number)
  result = []
  (1..number).to_a.each do |num|
    if number % num == 0
      result << num
    end
  end
  result
end


puts divisors(99400891) == [1, 9967, 9973, 99400891]