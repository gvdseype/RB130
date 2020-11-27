# find all the divisors between 1 and n exlcuded.
# sum these up, 
# if the sum is equal to n return perfect
# if the sum is higher then n return abundant
# if the sum is lower than n return deficient
class PerfectNumber
  def self.classify(number)
    raise StandardError if number < 0
    array = []
    (1...number).each do |n|
      number % n == 0 ? array << n : next
    end

    if array.sum == number
      'perfect'
    elsif array.sum > number
      'abundant'
    elsif array.sum < number
      'deficient'
    end
    
  end
end