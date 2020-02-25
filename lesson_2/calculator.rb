require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  /\A[+-]?\d+(\.[\d]+)?\z/.match(num)
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    "Multiplying"
  when '4'
    "Dividing"
  end
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = gets.chomp
  if name.empty?()
    puts MESSAGES['valid_name']
  else 
    break
  end
end

puts "Hello, #{name}!"

loop do # main loop
  number1 = ''
  loop do
    prompt(MESSAGES['first_number'])
    number1 = gets.chomp
    if valid_number?(number1)
      break
    else
      puts MESSAGES['valid_number']
    end
  end

  number2 = ''
  loop do
    prompt(MESSAGES['second_number'])
    number2 = gets.chomp
    if valid_number?(number2)
      break
    else
      puts MESSAGES['valid_number']
    end
  end

  prompt(MESSAGES['operator_prompt'])
  
  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      puts MESSAGES['valid_operation']
    end
  end

  puts "#{operation_to_message(operator)} the two numbers..."

  result = case operator
            when '1'
              number1.to_i + number2.to_i
            when '2'
              number1.to_i - number2.to_i
            when '3'
              number1.to_i * number2.to_i
            when '4'
              number1.to_f / number2.to_f
            end

  puts prompt(result)
  puts MESSAGES['another?']
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

puts MESSAGES['thanks']