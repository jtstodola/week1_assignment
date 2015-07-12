def prompt(message)
  puts message
  gets.chop
end


## This function doesn't need to reassign the output variable.
# def result_output(guesses)
#  if guesses == 1
#    "You're a mind reader!"
#  elsif guesses <= 4
#    "Most impressive."
#  ...
## No need for a variable because the IF statement returns a value, which then
## becomes the return of the function. And it's faster because variable value
## assignment is expensive.
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
    
  ## how about level = level.to_i right here so you don't
  ## have to do it on every condition test?
  ## 
  ## I might move this into a separate function. I really
  ## like how you alter the prompt based on the difficulty.
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
      
      ## You set the incorrect_answer to true by default above the while.
      ## so there's no reason to reset it. You only need to set it
      ## if they win.
      incorrect_answer = true
      
    elsif guess.to_i > number.to_i
      guess = prompt "Too high. Guess again: "
      incorrect_answer = true
        
    elsif(guess.to_i.to_s != guess)
      guess = prompt "Please only enter numbers. Guess again: "
        incorrect_answer = true
      
    else
      ## I think this adds an extra guess since your guesses get accumulated
      ## below after the IF statement finishes.
      guesses += 1
      puts "You got it in #{guesses} guesses! #{result_output(guesses)}" 
      incorrect_answer = false

    end

    ## right here - adding 1 to guesses.
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

## nice. I think I'd put "play" inside of "main" at the end tho.

play
