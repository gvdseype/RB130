#if number doesn't consist of 10 digits, return 10x "0"
# if number has 11 digits and first digit is 1, trim the first one.
# if number has 11 digits and first digit is not 1, then it is a bad number
# if the number is longer that 11 digits, then it is a bad number


class PhoneNumber
  attr_accessor :input
  attr_reader :wrong_number
  
  def initialize(number)
    @input = number.gsub(/[^a-z0-9]/, "")
    @wrong_number = '0000000000'
  end

  def wrong_number
    self.input = @wrong_number
    return input
  end

  def number
    input.size == 11 ? first_sign_1? : check2
  end

  def first_sign_1?
    input.chars[0] == "1" ? shift_first_sign : wrong_number
  end

  def shift_first_sign
    array = input.chars
    array.shift
    self.input = array.join
    check2
  end

  def check2
    input.size == 10 ? all_numbers? : wrong_number
  end

  def all_numbers?
    if (input =~ /\D/) != nil
      wrong_number
    else
      return input
    end
  end

  def area_code
    input[0..2]
  end

  def to_s
    self.number
    "(#{self[0..2]}) #{self[3..5]}-#{self[6..10]}"
  end

  def [](index)
    input[index]
  end

end




