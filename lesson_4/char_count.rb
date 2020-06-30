=begin 
Incorrect because it counts " " as a letter (looking for chars instead of letters)

statement = "The Flintstones Rock"

chars_hash = {}
statement.chars.each do |char|
  if chars_hash[char] == nil
    chars_hash[char] = 1
  else
    chars_hash[char] += 1
  end
end

puts chars_hash

=end

statement = "The Flintstones Rock"

chars_hash = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  chars_hash[letter] = letter_frequency if letter_frequency > 0
end

puts chars_hash