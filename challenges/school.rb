=begin
# add method will take a name argument, and a number argument telling to add to the grade. 
# The arrays should be sorted alphabetically.
# grade method will take an integer n, which will return an array with the kids attending n grade
#
=end

class School
  attr_accessor :hash

  def initialize
    @hash = {}
  end

  def sort_hash_keys!
    self.hash = hash.to_a.sort_by { |subarray| subarray[0] }.to_h
  end

  def sort_hash_values!
    hash.each { |key, value| value.sort!}
  end

  def add(name, grade)
    hash.keys.include?(grade) ? hash[grade] << name : hash[grade] = [name]
    sort_hash_values!
    sort_hash_keys!
  end

  def grade(number)
    hash.keys.include?(number) ? hash[number] : []
  end

  def to_h
    hash
  end

end

