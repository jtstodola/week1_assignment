def prompt(message)
  puts message
  gets.chop
end

def result_output(guesses)
  if guesses == 1
    output = "You're a mind reader!"

  elsif guesses <= 4
    output = "Most impressive."

  elsif guesses <= 6
    output = "You can do better than that."

  else
    output = "Better luck next time."

  end
    
end

def main
  puts "Let's play Guess The Number"
  level = prompt "Pick a difficulty level (1, 2, or 3)"
  invalid_number = true
    
  while(invalid_number) do    
  
    if(level.to_i == 1)
      puts "Pick a number between 1 and 10."
      invalid_number = false
      number = rand(1..10)

    elsif(level.to_i == 2)
      puts "Pick a number between 1 and 100."
      invalid_number = false
      number = rand(1..100)

    elsif(level.to_i == 3)
      puts "Pick a number between 1 and 1000."
      invalid_number = false
      number = rand(1..1000)

    else 
      level = prompt "Please enter either 1, 2, or 3. "
    end
  end
    
  guess = prompt "What is your guess?"

  incorrect_answer = true
    
  guesses = 0
  
  while(incorrect_answer) do
    if guess.to_i < number.to_i
      guess = prompt "Too low. Guess again: "
      incorrect_answer = true
      
    elsif guess.to_i > number.to_i
      guess = prompt "Too high. Guess again: "
      incorrect_answer = true
        
    elsif(guess.to_i.to_s != guess)
      guess = prompt "Please only enter numbers. Guess again: "
        incorrect_answer = true
      
    else
      guesses += 1
      puts "You got it in #{guesses} guesses! #{result_output(guesses)}" 
      incorrect_answer = false

    end

    guesses += 1
        
  end
end

def play
  play_again = true
  while(play_again) do
    again = prompt "Play again? Enter y for yes or n for no."

    if again == "y"
      main
    elsif again == "n"
      play_again = false
      puts "Goodbye!"
    else
      puts "#{again} is not a valid option."
    end
  end
end

main

play