class Octal
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def is_numeric?(obj) 
    obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end

  def to_decimal
    return 0 if is_numeric?(number) == false || number.include?('8') || number.include?('9')
    array = number.chars
    total = 0

    while array.size > 0 
      n = array.shift.to_i
      total += n * 8**array.size
    end
    total
  end
end


puts Octal.new('6789').to_decimal