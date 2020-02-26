VALID_CHOICES = %w(rock paper scissors lizard spock)
ABBREVIATIONS = ['r', 'p', 'sc', 'l', 'sp']
total_wins = { player_wins: 0, computer_wins: 0 }

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

def get_player_move(choice)
  case choice
  when 'r' then 'rock'
  when 'p' then 'paper'
  when 'sc' then 'scissors'
  when 'l' then 'lizard'
  else 'spock'
  end
end

def update_score(choice, computer_choice, total_wins)
  if win?(choice, computer_choice)
    total_wins[:player_wins] += 1
  elsif win?(computer_choice, choice)
    total_wins[:computer_wins] += 1
  end
end

def game_winner?(player_wins, computer_wins)
  if player_wins == 5
    true
  elsif computer_wins == 5
    true
  end
end

def declare_winner(player_wins, computer_wins)
  if player_wins == 5
    prompt("You are the grand winner!")
  elsif computer_wins == 5
    prompt("The computer is the grand winner!")
  end
end

prompt("Welcome! You will be playing against the computer to 5.")

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    prompt("You may abbreviate (r, p, sc, l, sp).")
    choice = gets.chomp
    if VALID_CHOICES.include?(choice) || ABBREVIATIONS.include?(choice)
      if ABBREVIATIONS.include?(choice)
        choice = get_player_move(choice)
      end
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")
  display_results(choice, computer_choice)

  update_score(choice, computer_choice, total_wins)
  prompt("Your score: #{total_wins[:player_wins]}")
  prompt("Computer score: #{total_wins[:computer_wins]}")

  if game_winner?(total_wins[:player_wins], total_wins[:computer_wins])
    declare_winner(total_wins[:player_wins], total_wins[:computer_wins])
    total_wins[:player_wins] = 0
    total_wins[:computer_wins] = 0
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
  system "clear"
end

prompt("Thank you for playing!")
