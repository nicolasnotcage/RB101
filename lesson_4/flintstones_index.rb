flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flint_hash = {}
flintstones.each_with_index do |name, index|
  flint_hash[name] = index
end

puts flint_hash