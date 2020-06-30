ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

youngest = 0
ages.each do |name, age|
  if youngest == 0
    youngest = age
  elsif age < youngest
    youngest = age
  end
end

puts youngest