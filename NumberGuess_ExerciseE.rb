#--------------------------------------------------------------------------
#
# Script Name: NumberGuess.rb
# Version:     1.1
# Author:      Corey Hicks
# Date:        28 January 2018
#
# Description: This Ruby script is a number guessing game that challenges
#              the player to guess a randomly generated number in as few
#              guesses as possible.
#
#   This program uses several methods to define the Game class: 3 display
# methods, a play_game method, and a generate_number method. In the play_game
# method the program calls the generate_number method to generate a random
# number. Second, the method enters a loop and a series of if/else statements
# that determine if the user entered the cheat code or a number outside of the
# game boundaries. After that, the loop will iterate the number of guesses made
# by the player and enters another if/else to determine if the guess was correct,
# low, or high. Finally, a fourth if/else is used to determine if the player has
# entered 10 guesses.
#
#   This week had us using several if/else statements, using loops to iterate
# numbers, and introduced arrays. I was able to use an empty array to store the
# number of guesses made by the player each time they played the game.
# Using the loop that was created, I was able to iterate through the array, pull
# out each element of the array, and add the elements together. This logic was
# made incredibly simple because Ruby allows for expandable arrays. I would have
# to use a list in C# to get the same effect.
#
#--------------------------------------------------------------------------


# Define custom classes ---------------------------------------------------

#Define a class representing the console window
class Screen

  def cls  #Define a method that clears the display area
    puts ("\n" * 25)  #Scroll the screen 25 times
    puts "\a"  #Make a little noise to get the player's attention
  end

  def pause    #Define a method that pauses the display area
    STDIN.gets  #Execute the STDIN class's gets method to pause script
                #execution until the player presses the enter key
  end

end

#Define a class representing the Ruby Number Guessing Game
class Game

  #This method displays the game's opening screen
  def display_greeting

    Console_Screen.cls  #Clear the display area

    #Display welcome message
    print "\t\t  Welcome to the Ruby Number Guessing Game!" +
    "\n\n\n\n\n\n\n\n\n\n\n\n\n\nPress Enter to " +
               "continue."

  Console_Screen.pause       #Pause the game

  end

  #Define a method to be used to present game instructions
  def display_instructions

    Console_Screen.cls       #Clear the display area
    puts "INSTRUCTIONS:\n\n"  #Display a heading

    #Display the game's instructions
    puts "This game randomly generates a number from 1 to 1000 and"
    puts "challenges you to identify it in as few guesses as possible."
    puts "After each guess, the game will analyze your input and provide"
    puts "you with feedback. You may take up to 10 turns in order to "
    puts "guess the game's secret number.\n\n\n"
    puts "Good luck!\n\n\n\n\n\n\n\n\n"
    print "Press Enter to continue."

    Console_Screen.pause       #Pause the game

  end

  #Define a method that generates the game's secret number
  def generate_number

    #Generate and return a random number between 1 and 100
    return randomNo = 1 + rand(1000)

  end

  #Define a method to be used control game play
  def play_game

    #Call on the generate_number method in order to get a random number
    number = generate_number

    #Loop until the player inputs a valid answer
    loop do

      Console_Screen.cls       #Clear the display area

      if $answer == "c"
        puts "The secret number is #{number}."
      end

      #Prompt the player to make a guess
      print "\nEnter your guess and press the Enter key: "

      reply = STDIN.gets  #Collect the player's answer
      reply.chop!         #Remove the end of line character
      reply = reply.to_i  #Convert the player's guess to an integer

      #Validate the player's input only allowing guesses between 1 and 100
      if reply < 1 or reply > 1000 then

        Console_Screen.cls       #Clear the display area

        #Prompt the player to make a guess
        print "\nYour guess must be between 1 and 1000! press the Enter key: "

        reply = STDIN.gets  #Collect the player's answer
        reply.chop!         #Remove the end of line character

        redo  #Redo the current iteration of the loop

      end

      $noOfGuesses += 1 #iterate number of guesses

      #Analyze the player's guess to determine if it is correct
      if reply == number then    #The player's guess was correct
        Console_Screen.cls        #Clear the display area
        print "You have guessed the number! Press enter to continue."
        Console_Screen.pause      #Pause the game
        break  #Exit loop
      elsif reply < number then  #The player's guess was too low
        Console_Screen.cls        #Clear the display area
        print "Your guess is too low! Press Enter to continue."
        Console_Screen.pause      #Pause the game
      elsif reply > number then  #The player's guess was too high
        Console_Screen.cls        #Clear the display area
        print "Your guess is too high! Press Enter to continue."
        Console_Screen.pause      #Pause the game
      end

      if $noOfGuesses == 10
        break
      end

    end

  end

  #This method displays the information about the Ruby Number Guessing Game
  def display_credits

    Console_Screen.cls  #Clear the display area

    #Thank the player and display game information
    puts "\t\tThank you playing the Ruby Number Guessing Game.\n\n\n\n"
    puts "\n\t\t\t Developed by Corey Hicks\n\n"
    puts "\t\t\t\t  Copyright 2018\n\n"
    puts "\t\t\tURL: http://www.bellevue.edu\n\n\n\n\n\n\n\n\n\n"

  end

end


# Main Script Logic -------------------------------------------------------

Console_Screen = Screen.new  #Instantiate a new Screen object
SQ = Game.new                #Instantiate a new Game object

#Execute the Game class's display_greeting method
SQ.display_greeting

$gameCount = 0
$noOfGuesses = 0
$totalNoOfGuesses = 0
$avgNoOfGuesses = 0
$answer = ""

#Loop until the player enters y or n and do not accept any other input
loop do

  Console_Screen.cls  #Clear the display area

  #Prompt the player for permission to start the game
  print "Are you ready to play the Ruby Number Guessing Game? (y/n): "

  $answer = STDIN.gets  #Collect the player's response
  $answer.chop!  #Remove any extra characters appended to the string

  #Terminate the loop if valid input was provided
  break if $answer == "y" || $answer == "n" || $answer == "c" #Exit loop

end

#Analyze the player's input
if $answer == "n"  #See if the player elected not to take the game

  Console_Screen.cls  #Clear the display area

  #Invite the player to return and play the game some other time
  puts "Okay, perhaps another time.\n\n"

else  #The player wants to play the game

    #Execute the Game class's display_instructions method
    SQ.display_instructions

  loop do

    #Execute the Game class's play_game method
    SQ.play_game

    Console_Screen.cls  #Clear the display area

    $gameCount += 1 #iteration of game count

    #initialize new empty array
    guessArray = []
    guessArray << $noOfGuesses  #adds number of guesses to array

    $noOfGuesses = 0  #reset current number of guesses to zero

    #analyze each element of the array, add them together, and assign them to
    #total number of guesses
    guessArray.each { |a| $totalNoOfGuesses += a }

    #calculate average number of guesses
    $avgNoOfGuesses = $totalNoOfGuesses / $gameCount

    #Prompt the player for permission start a new round of play
    puts "You have played #{$gameCount} game(s)."
    puts "Your average number of guesses is: #{$avgNoOfGuesses}."
    print "Would you like to play again? (y/n): "

    playAgain = STDIN.gets  #Collect the player's response
    playAgain.chop!  #Remove any extra characters appended to the string

    break if playAgain == "n"  #Exit loop

  end

  #Call upon the Game class's determine_credits method in order to thank
  #the player for playing the game and to display game information
  SQ.display_creditsE

end
