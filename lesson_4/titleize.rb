words = "the flintstones rock"

titleized = words.split.map do |word|
  word.capitalize!
end

puts titleized.join(' ')