# rules if the current value of the current key is also the last value of the last key, 
# don't add the current value to the result array.

class InvalidCodonError < StandardError
end

class Translation
  @@hash = {["AUG"] => "Methionine", ["UUU", "UUC"] => "Phenylalanine",
        ["UUA", "UUG"] => "Leucine", ["UCU", "UCC", "UCA", "UCG"] => "Serine",
        ["UAU", "UAC"] => "Tyrosine", ["UGU", "UGC"] => "Cysteine", 
        ["UGG"] => "Tryptophan", ["UAA", "UAG", "UGA"] => "STOP"}
  

  def self.of_codon(protein)
    result = []
    @@hash.each do |key, value| 
      if key.include?(protein) && result.empty?
        result << value
      elsif key.include?(protein) && result[-1] != value
        result << value
      elsif key.include?(protein) && result[-1] == value
        next
      elsif key.include?(protein) && value == "STOP"
        result << value
        return result
      end
    end
    p result.join(' ')
  end

  def self.of_rna(strand)
    array = strand.scan(/.../)
    result = []
    
    array.each do |protein|
      if @@hash.keys.flatten.none? {|word| word == protein} == true
        raise InvalidCodonError
      elsif protein == "UAA" || protein == "UAG" || protein == "UGA" 
        break
      else
        @@hash.each do |key, value|

          if key.include?(protein) && value == "STOP"
            result << value
            break
          elsif key.include?(protein) && result.empty?
            result << value
          elsif key.include?(protein) && result[-1] != value
            result << value
          elsif key.include?(protein) && result[-1] == value
            next
          end
        end
      end
    end
    p result
  end
end

strand = 'UGGUGUUAUUAAUGGUUU'
Translation.of_rna(strand)