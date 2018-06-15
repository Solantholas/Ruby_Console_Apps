#--------------------------------------------------------------------------
#
# Script Name: RubyJoke_ExerciseE.rb
# Version: 1.1
# Author: Corey Hicks
# Date: 17 December 2017
# Web Site: www.tech-publishing.com
# Last Update: 12/17/17 - Modified script comments and jokes
#
# Description: This Ruby script tells a series of 10 humorous jokes. First,
# a new class titled Screen is created with a method titled cls that puts /n
# 25 times. Second, Console_Screen is initialized as a new Screen object. Third,
# a boolean is used when prompting the user if they would like to hear a series
# of jokes. Fourth, if the user types 'n', the boolean and application ends. If
# the users types anything else, a series of 10 jokes are displayed and end with
# a thank you and copyright message.
#
#--------------------------------------------------------------------------


# Define custom classes ---------------------------------------------------

#Define a class representing the console window
class Screen
  def cls  #Define a method that clears the display area
    puts ("\n" * 25)  #Scroll the screen 25 times
  end
end


# Main Script Logic -------------------------------------------------------

Console_Screen = Screen.new  #Initialize a new Screen object

#Execute the Screen object's cls method in order to clear the screen
Console_Screen.cls

#Prompt the player for permission to begin the game
puts "Would you like to hear a few funny jokes? (y/n)"

#Collect the player's response
answer = STDIN.gets

#Remove any extra characters appended to the string
answer.chop!

#Analyze the player's response
if answer == "n"  #See if the player elected not to play

  Console_Screen.cls  #Clear the display area

  #Invite the player to return and play again
  puts "Sorry to hear that. Please return and play again soon."

else

  Console_Screen.cls  #Clear the display area

  #Display the beginning of the first joke
  puts "What is green and has wheels? (Press Enter)"

  pause = STDIN.gets  #Force the player to press Enter to continue

  #Display the punch line
  puts "Grass. I lied about the wheels. (Press Enter)"


  pause = STDIN.gets  #Force the player to press Enter to continue


  #Console_Screen.cls  #Clear the display area

  #Display the beginning of the second joke
  puts "What is red and smells like blue paint? (Press Enter)"

  pause = STDIN.gets  #Force the player to press Enter to continue

  #Display the punch line
  puts "Red paint. (Press Enter)"


  pause = STDIN.gets  #Force the player to press Enter to continue


  #Console_Screen.cls  #Clear the display area

  #Display the beginning of the third joke
  puts "What is brown and sticky? (Press Enter)"

  pause = STDIN.gets  #Force the player to press Enter to continue

  #Display the punch line
  puts "A brown stick. (Press Enter)"


  pause = STDIN.gets  #Force the player to press Enter to continue


  #Console_Screen.cls  #Clear the display area

  #Display the beginning of the fourth joke
  puts "What is a Vampire's favorite dessert? (Press Enter)"

  pause = STDIN.gets  #Force the player to press Enter to continue

  #Display the punch line
  puts "Vampire's aren't real. (Press Enter)"


  pause = STDIN.gets  #Force the player to press Enter to continue


  #Console_Screen.cls  #Clear the display area

  #Display the beginning of the fifth joke
  puts "What did the farmer say when he lost his tractor? (Press Enter)"

  pause = STDIN.gets  #Force the player to press Enter to continue

  #Display the punch line
  puts "Where is my tractor? (Press Enter)"


  pause = STDIN.gets  #Force the player to press Enter to continue

  #Console_Screen.cls  #Clear the display area

  #Display the beginning of the sixth joke
  puts "What do you call someone who kills a black person? (Press Enter)"

  pause = STDIN.gets  #Force the player to press Enter to continue

  #Display the punch line
  puts "A murderer. (Press Enter)"


  pause = STDIN.gets  #Force the player to press Enter to continue


  #Console_Screen.cls  #Clear the display area

  #Display the beginning of the seventh joke
  puts "Why did the Catholic priest get sent to jail? (Press Enter)"

  pause = STDIN.gets  #Force the player to press Enter to continue

  #Display the punch line
  puts "Tax evasion. (Press Enter)"


  pause = STDIN.gets  #Force the player to press Enter to continue


  #Console_Screen.cls  #Clear the display area

  #Display the beginning of the eighth joke
  puts "Why is 6 afraid of 7? (Press Enter)"

  pause = STDIN.gets  #Force the player to press Enter to continue

  #Display the punch line
  puts "It's not. Numbers aren't sentient and thus incapable of feeling fear. (Press Enter)"


  pause = STDIN.gets  #Force the player to press Enter to continue


  #Console_Screen.cls  #Clear the display area

  #Display the beginning of the nineth joke
  puts "When is a door not a door? (Press Enter)"

  pause = STDIN.gets  #Force the player to press Enter to continue

  #Display the punch line
  puts "When it is half-open (Press Enter)"


  pause = STDIN.gets  #Force the player to press Enter to continue


  #Console_Screen.cls  #Clear the display area

  #Display the beginning of the tenth joke
  puts "What did Batman say to Robin before they got in the car? (Press Enter)"

  pause = STDIN.gets  #Force the player to press Enter to continue

  #Display the punch line
  puts "Get in the car. (Press Enter)"


  pause = STDIN.gets  #Force the player to press Enter to continue


  Console_Screen.cls  #Clear the display area

  puts "Thanks for playing the Ruby Joke game!"
  puts ""
  puts "Copyright 2017"

end
