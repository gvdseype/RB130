require 'date'

class Meetup
  attr_accessor :month, :year

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(day_in_week, day_in_month)
    if day_in_month == :teenth
      Date.civil(year, month, tenth(day_in_week))
    elsif day_in_month == :first
      Date.civil(year, month, firsty(day_in_week))
    elsif day_in_month == :second
      Date.civil(year, month, secondy(day_in_week))
    elsif day_in_month == :third
      Date.civil(year, month, thirdly(day_in_week))
    elsif day_in_month == :fourth
      Date.civil(year, month, fourthly(day_in_week))
    elsif day_in_month == :last
      Date.civil(year, month, lastly(day_in_week))
    end
  end

  def tenth(day_in_week) 
    number_day = 13
      loop do 
        d = Date.new(year, month, number_day)
        break if d.strftime('%A').downcase == day_in_week.to_s
        number_day += 1
      end
    return number_day
  end

  def firsty(day_in_week)
    number_day = 1
    loop do 
      d = Date.new(year, month, number_day)
      break if d.strftime('%A').downcase == day_in_week.to_s
      number_day += 1
    end
    return number_day
  end

  def secondy(day_in_week)
    firsty(day_in_week) + 7
  end

  def thirdly(day_in_week)
    firsty(day_in_week) + 14
  end

  def fourthly(day_in_week)
    firsty(day_in_week) + 21
  end

  def lastly(day_in_week)
    number_day = -1
       
    loop do
      d = Date.civil(year, month, number_day)
      break if d.strftime('%A').downcase == day_in_week.to_s
      number_day -= 1
    end
    Date.civil(year, month, number_day).strftime('%d').to_i
  end

end

t = Time.now
100_000.times { x = Meetup.new(9, 2013).day(:thursday, :last) }
p Time.now - t

