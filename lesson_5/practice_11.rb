arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

threes = arr.map do |array|
  array.select { |x| x % 3 == 0}
end

p threes
