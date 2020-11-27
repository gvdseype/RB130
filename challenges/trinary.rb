class Trinary
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def is_numeric?(obj) 
    obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end

  def to_decimal
    return 0 if is_numeric?(number) == false
    total = 0
    array = number.chars
    while array.size != 0
      n = array.shift.to_i
      total += (n*3**array.size)
    end
    total
  end
end

