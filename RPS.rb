#--------------------------------------------------------------------------
#
# Script Name: RPS.rb
# Version:     1.1
# Author:      Corey Hicks
# Date:        09 February 218
#
# Description: This Ruby game s a computerized version of the classic
#              children's Rock, Paper, Scissors game, in which the player goes
#              head-to-head against the computer.
#
#   This week we introduce three methods into the game class: get_player_move,
# get_computer_move, and analyze_results. get_player_move asks the user to type
# an answer of Rock, Paper, or Scissors as their guess for the RPS game. This
# method has been modified to also accept r/R, s/S, and p/P for ease of play.
# get_computer_move assights all three guess options to an array, randomly
# generates a number between 0 and 2 and then assigns the array value in the
# respected position. Finally, the analyze_results method determines what answer
# the user and computer chose. This is accomplished by using inner and outer IF
# statements.
#
#   This week focused heavily on advanced object oriented concepts: abstraction,
# encapsulation, inheritance, and polymorphism. Our reading this week touched
# on these concepts and our program relied heavily on encapsulation and global
# variables to accomplish the logic. Encapsulation can be seen with the @choice
# variable in the get_player_move method. The @choice variable is only
# accessible in the get_player_move method whereas the global variables are
# accessible in any method, or class, or even in the main script logic.
#--------------------------------------------------------------------------


# Define custom classes ---------------------------------------------------

#Define a class representing the console window
class Screen

  def cls  #Define a method that clears the display area
    puts ("\n" * 25)  #Scroll the screen 25 times
    puts "\a"   #Make a little noise to get the player's attention
  end

  def pause    #Define a method that pauses the display area
    STDIN.gets  #Execute the STDIN class's gets method to pause script
                #execution until the player presses the enter key
  end

end

#Define a class representing the Rock, Paper, scissors game
class Game

  #This method displays the game's opening message
  def display_greeting

    Console_Screen.cls  #Clear the display area

    #Display welcome message
    print "\t\t\tLet's Play Rock, Paper, Scissors!" +
    "\n\n\n\n\n\n\n\n\n\n\n\n\n\nPress Enter to " +
               "continue. "

    Console_Screen.pause       #Pause the game

  end

  #Define a method to be used to present game instructions
  def display_instructions

    Console_Screen.cls       #Clear the display area
    puts "INSTRUCTIONS:\n\n"  #Display a heading

    #Display the game's instructions
    puts "This game pits the player against the computer. To play, you must"
    puts "enter one of the following moves when prompted: Rock, Paper, or"
    puts "Scissors.\n\n"
    puts "The game will randomly select a move for the computer, and "
    puts "the two moves will then be analyzed according to the following"
    puts "rules: \n\n"
    puts "* Rock crushes Scissors, Rock equals Rock, and Rock is covered by"
    puts "  Paper.\n\n"
    puts "* Paper covers Rock, Paper equals Paper, and Paper is cut by"
    puts "  Scissors.\n\n"
    puts "* Scissors cut Paper, Scissors equals Scissors, and Scissors are"
    puts "  crushed by Rock.\n\n\n"
    puts "Good luck!\n\n\n"
    print "Press Enter to continue. "
    Console_Screen.pause       #Pause the game

  end

  #Define a method to control game play
  def play_game

    Console_Screen.cls       #Clear the display area

    #Call on the method responsible for collecting the player's move
    playerMove = get_player_move

    #Call on the method responsible for generating the computer's move
    computerMove = get_computer_move

    #Call on the method responsible for determining the results of the game
    result = analyze_results(playerMove, computerMove)

    #CAll on the method responsible for ingrementing the game count
    game_Count

    #Call on the method responsible for displaying the results of the game
    display_results(playerMove, computerMove, result)

  end

  #Define the method responsible for collecting the player's move
  def get_player_move

    Console_Screen.cls       #Clear the display area

    loop do  #Loop forever

      Console_Screen.cls  #Clear the display area

      #Prompt the player to select a move
      puts "To make a move, type one of the following and press Enter:\n\n"
      puts "\a"
      print "[Rock] [Paper] [Scissors]: "

      @choice = STDIN.gets  #Collect the player's answer
      @choice.chop!  #Remove any extra characters appended to
                            #the string

      #accept input of r or R and convert string to Rock
      if @choice =~ /r|R/
        then @choice = "Rock"
      end

      #accept input of p or P and convert string to Paper
      if @choice =~ /p|P/
        then @choice = "Paper"
      end

      #accept input of s or S and convert string to Scissors
      if @choice =~ /s|S/
        then @choice = "Scissors"
      end

      #Terminate the loop if valid input was provided
      break if @choice  =~ /Rock|Paper|Scissors/i

    end

    #Convert the player move to upper case and return it to the calling
    #statement
    return @choice.upcase

  end

  #Define the method responsible for making the computer's move
  def get_computer_move

    #Define and array containing a list of three possible moves
    moves = ["ROCK", "PAPER", "SCISSORS"]

    #Generate and return a random number between 0 and 2
    randomNo = rand(3)

    #Return a randomly selected move to the calling statement
    return moves[randomNo]

  end

  #Define the method responsible for analyzing and returning the result of
  #the game (arguments are passed as upper case characters)
  def analyze_results(player, computer)

    #Analyze the results of the game when the player selects ROCK
    if player == "ROCK" then
       if computer == "SCISSORS" then
         $wins += 1
         return "Rock crushes Scissors. Player wins!"
       end
       if computer == "ROCK"
         $tied += 1
         return "Rock equals Rock. Tie!"
       end
       if computer == "PAPER"
         $lost += 1
         return "Rock is covered by Paper. Computer wins!"
       end
    end

    #Analyze the results of the game when the player selects PAPER
    if player == "PAPER" then
       if computer == "ROCK" then
         $wins += 1
         return "Paper covers Rock. Player wins!"
       end
       if computer == "PAPER"
         $tied += 1
         return "Paper equals Paper. Tie!"
       end
       if computer == "SCISSORS"
         $lost += 1
         return "Paper is cut by Scissors. Computer wins!"
       end
    end

    #Analyze the results of the game when the player selects SCISSORS
    if player == "SCISSORS" then
       if computer == "PAPER" then
         $wins += 1
         return "Scissors cut Paper. Player wins!"
       end
       if computer == "SCISSORS"
         $tied += 1
         return "Scissors equals Scissors. Tie!"
       end
       if computer == "ROCK"
         $lost += 1
         return "Scissors are crushed by Rock. Computer wins!"
       end
    end

  end

  #Define the method responsible for displaying the result of the game
  def display_results(player, computer, result)

    #Display arguments passed to the method using the following template
    Console_Screen.cls       #Clear the display area
    puts "\n\n\t\t\tRESULTS:"
    puts "\n\n\t\t\t================================"
    puts "\n\n\t\t\tPlayer's move:    " + player
    puts "\n\n\t\t\tComputer's move:  " + computer
    puts "\n\n\t\t\tResult:           " + result
    puts "\n\n\t\t\tGames played:     #{$gameCount}"
    puts "\n\n\t\t\tWins:             #{$wins}"
    puts "\n\n\t\t\tLosses:           #{$lost}"
    puts "\n\n\t\t\tTies:             #{$tied}"
    puts "\n\n\t\t\t================================"
    puts "\n\n\n\n"
    puts "\a"
    print "Press Enter to continue. "
    Console_Screen.pause       #Pause the game

  end

  #define the method responsible for calculating the number of game plays
  def game_Count

    #increments the gameCount global variable by 1
      $gameCount += 1

  end

  #This method displays the information about the Rock, Paper,
  #Scissors game
  def display_credits

    Console_Screen.cls  #Clear the display area

    #Thank the player and display game information
    puts "\t     Thank you for playing the Rock, Paper, Scissors game.\n\n\n\n"
    puts "\n\t\t\t Developed by Corey Hicks\n\n"
    puts "\t\t\t\t  Copyright 2018\n\n"
    puts "\t\t\tURL: http://www.bellevue.edu\n\n\n\n\n\n\n\n\n\n"

  end

end


# Main Script Logic -------------------------------------------------------

$gameCount = 0
$wins = 0
$lost = 0
$tied = 0

Console_Screen = Screen.new  #Instantiate a new Screen object
RPS = Game.new                    #Instantiate a new Game object

#Execute the Game class's display_greeting method
RPS.display_greeting

answer = ""  #Initialize variable and assign it an empty string

#Loop until the player enters y or n and do not accept any other input
loop do

  Console_Screen.cls  #Clear the display area

  #Prompt the player for permission to start the game
  print "Are you ready to play Rock, Paper, Scissors? (y/n): "

  answer = STDIN.gets  #Collect the player's answer
  answer.chop!  #Remove any extra characters appended to the string

  #Terminate the loop if valid input was provided
  break if answer =~ /y|n/i

end

#Analyze the player's answer
if answer =~ /n/i  #See if the player wants to quit

  Console_Screen.cls  #Clear the display area

  #Invite the player to return and play the game some other time
  puts "Okay, perhaps another time.\n\n"

else  #The player wants to play the game

  #Execute the game class's display_instructions method
  RPS.display_instructions

  playAgain = ""

  loop do  #Loop forever

    #Execute the Game class's play_game method
    RPS.play_game

    loop do  #Loop forever

      Console_Screen.cls  #Clear the display area

      #Find out if the player wants to play another round
      print "Would you like to play again? (y/n): "

      playAgain = STDIN.gets  #Collect the player's response
      playAgain.chop!  #Remove any extra characters appended to the string

      #Terminate the loop if valid input was provided
      break if playAgain =~ /n|y/i

    end

    #Terminate the loop if valid input was provided
    break if playAgain =~ /n/i

  end

  #Call upon the Game class's determine_credits method
  RPS.display_credits

end
