class DNA
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def hamming_distance(string2)
    number_counts = [string.size, string2.size].min
    number_difference = 0
    number_counts.times { |n| string[n] != string2[n] ? number_difference += 1 : next }
    number_difference
  end
end
