# go through every word with map function
  #go through every letter of each word with map function
    #if the first letter.downcase is not part of the alphabet, shift it. return word
# iterate through array, add word.downcase and count to hash. return word

class Phrase
  attr_reader :phrase

  def initialize(phrase)
    @phrase = phrase
  end

  def clean_array(string)
    array = string.split(' ')
    alphabet = ('a'..'z').to_a + ('0'..'10').to_a << "'"
    array = array.map do |word|
      return_value = []
      word.chars.each_with_index do |sign, index|
        if word.size == 1 && alphabet.include?(sign) == false
          next
        elsif sign == "'" && index == 0 || sign == "'" && index == word.size-1
          next
        elsif alphabet.include?(sign.downcase)
          return_value << sign.downcase
        end
      end
      return_value.join
    end
    array.delete_if { |word| word.size < 1}
  end

  def word_count
    array = clean_array(phrase)
    hash = {}
    array.each do |word|
      if hash.include?(word)
        hash[word] += 1
      else
        hash[word] = 1
      end
    end
    hash
  end
end

