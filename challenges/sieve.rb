  
class Sieve
  attr_reader :integer
  def initialize(integer)
    @integer = integer
  end

  def primes
    result = [2]
    2.upto(@integer) do |number|
      divisible?(result, number) ? result << number : next
    end
    p result
  end

  def divisible?(array, number)
    answer = true
    array.each do |n|
      if number % n == 0
        answer = false
        break
      end
    end
    answer
  end
end

