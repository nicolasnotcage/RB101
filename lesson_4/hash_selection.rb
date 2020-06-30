def select_fruit(produce)
  produce_keys = produce.keys
  counter = 0
  fruits_hash = { }

  loop do
    break if counter == produce.size
      
    current_key = produce_keys[counter]
    current_value = produce[current_key]

    if current_value == "Fruit"
      fruits_hash[current_key] = current_value
    end

    counter += 1
  end

  fruits_hash
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}