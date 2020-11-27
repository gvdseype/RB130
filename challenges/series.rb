
class Series
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def slices(length) #selects only the the substrings that are consecutive by the length provided in the argument
    return ArgumentError if string.size < length
    
    result = all_sub_integers(string.split(''), length).select do |substring|
      substring if are_consecutive?(substring)
    end
    result.map! do |string|
      string.split('').map! do |letter|
        letter.to_i
      end
    end
    p result
  end

  def are_consecutive?(string) #provided a string of integers, this method will return true if they are consecutive.
    array = string.split('')   #the length of the string of integers was predifined 
    answer = true
    1.upto(array.size-1) do |n|
      if (array[n-1].to_i) + 1 != array[n].to_i
        answer = false
        return false
      end
    end
    answer
  end

  def all_sub_integers(array, length) #provided an array and a length, this method will return all the possible subintegers, in string format. 
    last_index = length
    result = []
    array.each_with_index do |n, index|
      result << array.slice(index..last_index-1)
      last_index += 1
      break if last_index == array.size + 1
    end
    result.map! do |subarray|
      subarray.map! do |number|
        number.to_s
      end.join
    end
    result
  end

end


series = Series.new("92834")
series.slices(1)