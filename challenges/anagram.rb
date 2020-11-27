# detector is an object from the Anagram class
# anagram is a local variable assigned to the return value
  # of the instance method match called on a Anagram object
# the match method should return the possible anagrams by comparing
# the name of detector with the array passed as argument in the instanc method match
# we should downcase! the name of detector object, and all the strings in the array passed in method
# if the word is exactly the same, don't check if its an anagram


class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def edge_case(test)
    return false if test.upcase == word
    return false if test == word.upcase
    return false if test == word
    return false if test.capitalize == word
    return false if test == word.capitalize
    true
  end

  def comparable_hash(word)
    hash = {}
    ('a'..'z').each { |letter| hash[letter.downcase] = 0 }
    word.split('').each { |let| hash[let.downcase] += 1 }
    hash
  end

  def match(array)
    result = array.select { |candidate| candidate if comparable_hash(word) == comparable_hash(candidate.downcase) && edge_case(candidate)}
    result.uniq
  end
end

detector = Anagram.new('Orchestra')
p detector.match(%w(cashregister Carthorse radishes))
