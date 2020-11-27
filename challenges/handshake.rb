class SecretHandshake
  attr_accessor :number, :result
  
  def initialize(number)
    @number = number
    if number.is_a?(Integer)
      @number = number.to_s(2)
    end
  end


  def is_binary?
    number.split('').all? { |num| num == "1" || num == "0" }
  end

  def commands
    output = []
    handshake = []
    hash = { "1" => "wink", "10" => "double blink", "100" => "close your eyes", "1000" => "jump"}
    number_of_zero = number.size - 1
    if is_binary? == false
      return output
    else
      number.split('').each do |num|
        if num == "1"
          output << num + ("0" * number_of_zero)        
        end
        number_of_zero -= 1
      end
    end
    output.reverse.each do |num|
      case num
      when "1" then handshake << "wink"
      when "10" then handshake << "double blink"
      when "100" then handshake << "close your eyes"
      when "1000" then handshake << "jump"
      end
    end
    if output.include?("10000")
      handshake = handshake.reverse
    end
    p handshake
  end
end

handshake = SecretHandshake.new('piggies')
handshake.commands # => ["jump","wink"]

