def return_index_in_alphabet(alpabet, letter)
  index = nil
  alpabet.each_with_index do |let, ind|
    if let == letter && ind <= 12
      index = ind + 13
    elsif let == letter && ind > 12
      index = ind - 13
    end
  end
  index
end

def decrypt(string)
  alphabet = ('A'..'Z').to_a
  alphabet2 = ('a'..'z').to_a
  array = string.split('')
  array.map! do |letter|
    if alphabet.include?(letter)
      alphabet[return_index_in_alphabet(alphabet, letter)]
    elsif alphabet2.include?(letter)
      alphabet2[return_index_in_alphabet(alphabet2, letter)]
    else
      letter
    end
  end
  array.join
end

puts decrypt('Wbua Ngnanfbss')
