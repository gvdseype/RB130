
# for instance method verse takes one argument n, implement the instance method once for n
# make an exception in exception in the string returned for no bottles of beer

# for instance method verses take two arguments, n and m both including, 
# which is the range for how many times we will display the beer song. 

# the lyrics instance method takes no argument and knows it needs to run the song from 99 bottles to 0.

class No_bottles
  def self.message(number)
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, #{number} bottles of beer on the wall.\n"
  end
end

class Normal_bottles
  attr_reader :number
  
  def initialize(number)
    @number = number
  end

  def bottles
    "#{number} bottle of beer on the wall, #{number} bottle of beer.\n" \
    "Take it down and pass it around, #{number - 1} bottles of beer on the wall.\n"
  end
end

def lyrics
  verse(99, 0)
end

class BeerSong
  def verse(number, range=nil)
    amount_bottles = number
    if range == nil
        if number == 0
          puts No_bottles.message(number)
        else
          puts Normal_bottles.new(amount_bottles).bottles
        end
    else 
      0.upto(number - range) do |n|
        if amount_bottles == 0
          puts No_bottles.message(number)
        elsif n < (number - range)
          puts Normal_bottles.new(amount_bottles).bottles
          amount_bottles -= 1
        end
      end
    end
  end
end

BeerSong.new.verse(1)