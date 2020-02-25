def prompt(string)
  puts "=> #{string}"
end

# check if number is valid
def valid_number?(num)
  /\A[+-]?\d+(\.[\d]+)?\z/.match(num)
end

# return monthly payment
def monthly_payment(loan_amount, interest_rate, loan_duration)
  loan_amount * (interest_rate / (1 - (1 + interest_rate)**(-loan_duration)))
end

prompt("Welcome to the Payment Calculator!")

loop do
  # get loan amount
  prompt("How much is the loan? Please don't include special characters.")

  total = ''
  loop do
    total = gets.chomp
    if valid_number?(total)
      break
    else
      prompt("Please enter the value in a whole number.")
    end
  end

  # get APR
  prompt("What is the APR of your loan?")

  apr = ''
  loop do
    apr = gets.chomp
    if valid_number?(apr)
      break
    else
      prompt("Not a valid APR. Please enter just the percentage (e.g. 7.5)")
    end
  end

  annual_interest_rate = apr.to_f / 100
  monthly_rate = annual_interest_rate / 12

  # get loan duration
  prompt("How many years is the loan term?")

  years = ''
  loop do
    years = gets.chomp
    if valid_number?(years)
      break
    else
      prompt("Not a valid number of years.")
    end
  end

  total_months = years.to_i * 12

  your_monthly_payment = monthly_payment(total.to_f, monthly_rate, total_months)

  prompt("Your monthly payment is: $#{format('%02.2f', your_monthly_payment)}")
  prompt("Would you like to perform another calculation?")
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the Car Payment Calculator!")
