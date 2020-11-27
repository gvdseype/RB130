=begin
  Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end of the word.
  Rule 2: If a word begins with a consonant sound, move it to the end of the word, 
          and then add an "ay" sound to the end of the word.
=end


class PigLatin
  @@vowels = ["a", "o", "i", "u", "e", "y"]
  
  def self.pig_it(word)
    if @@vowels.include?(word[0])
      word = word + "ay"
    else
      array = word.split('')
      shifted = []
      until @@vowels.include?(array[0])
        shifted << array.shift
      end
      array << shifted.join('') << "ay"
      array.join
    end
  end

  def self.translate(sentence)
    array = sentence.split(' ')
    array.map! { |word| pig_it(word) }
    p array.join(' ')
  end

end

PigLatin.translate('yttria')