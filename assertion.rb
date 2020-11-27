class Person
  attr_reader :age
  @age = 0
  
  def tells_age
    puts "my age is #{age}"
  end
end

gilles = Person.new

p gilles.age