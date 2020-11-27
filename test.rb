string = "The lazy cat.
The dog barks.
Down the rabbit hole.
The lazy cat, chased by the barking dog,
dives down the rabbit hole.
catalog
The Yellow Dog
My bearded dragon's name is Darwin"
delimiter = ['.', ',', ' ', /\n/]
string.split(Regexp.union(delimiter)).each do |word|
  p word if word.match(/(Dog)/i)
end
