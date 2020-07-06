hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

size_color = []
hsh.each do |key, value|
  if value[:type] == 'fruit'
    size_color << value[:colors].map {|word| word.capitalize}
  else
    size_color << value[:size].upcase
  end
end

p size_color
