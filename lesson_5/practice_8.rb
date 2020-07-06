hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = %w(a e i o u)
hsh.each_value do |value|
  value.each do |word| 
    chars = word.chars
    for char in chars
      puts char if vowels.include?(char)
    end
  end
end
      