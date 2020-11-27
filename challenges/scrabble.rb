
class Scrabble
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def score
    return 0 if word == nil
    total = 0
    hash = {"AEIOULNRST" => 1, "DG" => 2, "BCMP" => 3, "FHVWY" => 4, "K" => 5, "JX" => 8, "QZ" => 10}
    word.chars.each do |sign|
      hash.each_key do |key|
        key.include?(sign.upcase) ? total += hash[key] : next
      end
    end
    total
  end

  def self.score(input)
    self.new(input).score
  end

end

