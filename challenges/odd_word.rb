def print_and_or_reverse(word, switch)
  returned_value = nil
  word.split('').each { |letter| puts letter }.join('')
  if switch
    returned_value = word.reverse
  else
    returned_value = word
  end
  returned_value
end

def odd_word(string)
  string.gsub!(/[.]/, '')
  array = string.split(' ')
  array = array.map.with_index do |word, index|
    index.odd? ? print_and_or_reverse(word, true) : print_and_or_reverse(word, false)
  end
  array.join(' ') << "."
end

p odd_word("")
p odd_word("Ab cd w 22 3\n.")
p odd_word(".")
p odd_word("ra dwaa ddew   dedwed    .")

