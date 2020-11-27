class Cat
  attr_accessor :name, :purr_factor

  def initialize(name, second_argument)
    @name = name
    @purr_factor = second_argument
  end

  def miaow
    "#{name} is miaowing."
  end
end