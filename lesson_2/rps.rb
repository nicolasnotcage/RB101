VALID_CHOICES = %w(rock paper scissors lizard spock)
player_wins = 0
computer_wins = 0

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  outcomes = { 'rock' => ['lizard', 'scissors'],
               'paper' => ['rock', 'spock'],
               'scissors' => ['paper', 'lizard'],
               'spock' => ['rock', 'scissors'],
               'lizard' => ['spock', 'paper'] }
  outcomes[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You win!")
  elsif win?(computer, player)
    prompt("You lose!")
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  abbreviations = ['r', 'p', 'sc', 'l', 'sp']
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp
    if VALID_CHOICES.include?(choice) || abbreviations.include?(choice)
      if abbreviations.include?(choice)
        choice = case choice
                 when 'r' then 'rock'
                 when 'p' then 'paper'
                 when 'sc' then 'scissors'
                 when 'l' then 'lizard'
                 else 'spock'
                 end
      end
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  if win?(choice, computer_choice)
    player_wins += 1
    if player_wins == 5
      prompt("You are the grand winner with 5 wins!")
      break
    else
      prompt("Your score: #{player_wins}")
      prompt("Computer score: #{computer_wins}")
    end
  elsif win?(computer_choice, choice)
    computer_wins += 1
    if computer_wins == 5
      prompt("The computer is the grand winner with 5 wins!")
      break
    else
      prompt("Your score: #{player_wins}")
      prompt("Computer score: #{computer_wins}")
    end
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing!")
