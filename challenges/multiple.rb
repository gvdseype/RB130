class SumOfMultiples
  attr_reader :array

  def initialize(*default)
    @array = nil
    default.count > 0 ? @array = default : @array = [3, 5]
  end

  def to(n)
    multiples = []
    1.upto(n - 1) do |number|
      array.each do |divider|
        number % divider == 0 ? multiples << number : next
      end
    end
    multiples.uniq.sum
  end

  def self.to(n)
    new.to(n)
  end
end

puts SumOfMultiples.to(10)
