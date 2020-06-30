flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

index = flintstones.index do |name|
  name[0..1] == "Be"
end

puts index

