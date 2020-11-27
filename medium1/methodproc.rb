def convert_to_base_8(n)
  first, second = n.divmod(8)
  result = (first * 10) + second
end

# The correct type of argument must be used below
base8_proc = method(:convert_to_base_8).to_proc #first we need to convert the method into a symbol,
#afterwards we convert the symbol itno a proc

# # We'll need a Proc object to make this code work. Replace `a_proc`
# # with the correct object
p [8, 10, 12, 14, 16, 33].map(&base8_proc)


#expected return value of map [10, 12, 14, 16, 20, 41]