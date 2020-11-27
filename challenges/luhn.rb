=begin
The Luhn algorithm starts by the end of the number, from the last right digit to the first left digit. 
Multiplying by 2 all digits of even rank. If the double of a digit is equal or superior to 10, 
replace it by the sum of its digits. 

The number 853X, with X=0, the digit to calculate.
Take the digit 3, doubled, 3*2 = 6.
Takes the digit 5, not multiplied by 2
Take the 8, multiplies it by 2 : 8*2=16 and 1+6=7 to get 7.
The sum is 6+5+7 = 18. As 18 modulo 10 = 8, one calculated (10 - 8) %10 = 2, 2 is the digit checksum control. 
So 8532 is valid according to Luhn.
=end

def luhned(number)
  if number * 2 >= 10
    return (number * 2) - 9
  else
    return number * 2
  end
end



number = 12_121
array = number.to_s.split(//).map { |num| num.to_i }
result = []
array = array.reverse.each_with_index.map do |digit, index|
  if index.even?
    digit
  else
    luhned(digit)
  end
end.reverse
p array

if result.sum.to_s.split('')[-1] == '0'
  puts true
else
  puts false
end

