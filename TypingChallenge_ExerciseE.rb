#--------------------------------------------------------------------------
#
# Script Name: TypingChallenge_ExerciseE.rb
# Version:     1.1
# Author:      Corey Hicks
# Date:        14 Jan 2018
#
# Description: This Ruby script demonstrates how to apply conditional logic
#              in order to analyze user input and control script execution
#              through the development of a computer typing test that
#              evaluates the player's typing skills.
#
#      This program contains 2 pre-defined classes and methods to accomplish
# this task. First, a Screen class and methods are created, just like the
# Crazy8Ball. Second, the Test class is created with 4 defined methods:
# display_greeting, display_instructions, present_test, and determine_grade.
# Both of the display methods only serve the purpose of displaying string values
# to the user. present_test begins an until loop that breaks when the user
# enters a string value. Also, the present_test method uses an if/else statement
# to determine if the user entered their string correctly or not.
# determine_grade uses a case/switch statement to determine which letter grade
# to assign the user based on how many sentences they correctly retyped. An
# if/else statement is used to determine if the program should display the win
# or loss string.
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
                #execution until the player presses the Enter key
  end

end

#Define a class representing the typing test
class Test

  #This method displays the 8-ball greeting message
  def display_greeting

    Console_Screen.cls  #Clear the display area

    #Display a welcome screen
    print "\t\t  Welcome to the Ruby Typing Challenge game!" +
    "\n\n\n\n\n\n\n\n\n\n\n\n\nPress Enter to " +
               "continue. \n\n: "

  Console_Screen.pause       #Pause the game

  end

  #Define a method to be used to present test instructions
  def display_instructions

    Console_Screen.cls       #Clear the display area
    puts "\t\t\tInstructions:\n\n"  #Display a heading

    #Display the game's instructions
    puts %Q{    This test consists of a series of 10 typing challenges.
    The challenge sentences are presented one at a time. To respond
    correctly, you must retype each sentence exactly as shown and press
    the Enter key. Your grade will be displayed at the end of the test!
    \n\n
    "A = 9-10, B = 8, C = 7, D = 6, and anything lower is an F.
    \n\n\n\n\n\n\n\n\n
    Press Enter to continue.\n\n}

    Console_Screen.pause       #Pause the game

  end

  #Define a method to be used to present typing challenges
  def present_test(challenge)

    result = ""

    until result != ""  #loops until the user enters a string
    Console_Screen.cls       #Clear the display area
    print challenge + "\n\n: "  #Display the challenge sentence
    result = STDIN.gets  #Collect the player's input
    result.chop!         #Remove the end of line marker

    end

    #Analyze the player input and see if it is correct
    if challenge == result then

      #Keep track of the number of correctly retyped challenge sentences
      $noRight += 1
      Console_Screen.cls       #Clear the display area
      #Keep the player informed
      print "Correct!\n\nPress Enter to continue."
      Console_Screen.pause       #Pause the game

    else

      Console_Screen.cls       #Clear the display area
      #Keep the player informed
      print "Incorrect!\n" +
      challenge + "\n" + #Display what the challenge sentance was
      result + #Display user input
      "\n\nPress Enter to continue."
      Console_Screen.pause       #Clear the game

    end

  end

  #Define a method to be used to display test results
  def determine_grade

    Console_Screen.cls       #Clear the display area

    #To pass the test the player must correctly retype 6 sentences
    case $noRight
    when 9..10
      $letterGrade = "A"
    when 8
      $letterGrade = "B"
    when 7
      $letterGrade = "C"
    when 6
      $letterGrade = "D"
    else
      $letterGrade = "F"
    end

    if $noRight >= 6 then

      #Inform the player of the good news
      print "You retyped " + $noRight.to_s + " sentence(s) correctly. "
      puts "You have passed the typing test with a/n " + $letterGrade +
      "!\n\nPress Enter to continue."

    else  #The player has failed the test

      #Inform the player of the bad news
      print "You retyped " + $noRight.to_s + " sentence(s) correctly. "
      puts "You have failed the typing test!\n\nPress Enter to continue."

    end

  end

end


# Main Script Logic -------------------------------------------------------

#Initialize global variable that will be used to keep track of the number
#of correctly retyped sentences
$noRight = 0

Console_Screen = Screen.new  #Instantiate a new Screen object
Typing_Test = Test.new        #Instantiate a new Test object

#Execute the Test object's display_greeting method
Typing_Test.display_greeting

#Execute the Screen object's cls method in order to clear the screen
Console_Screen.cls

#Prompt the player for permission to begin the test
print "Would you like to test your typing skills? (y/n)\n\n: "

answer = STDIN.gets  #Collect the player's response
answer.chop!  #Remove any extra characters appended to the string

#Loop until the player enters y or n and do not accept any other input.
until answer == "y" || answer == "n"

  Console_Screen.cls  #Clear the display area

  #Prompt the player for permission to begin the test
  print "Would you like to test your typing skills? (y/n)\n\n: "

  answer = STDIN.gets  #Collect the player's response
  answer.chop!  #Remove any extra characters appended to the string

end

#Analyze the player's response
if answer == "n"  #See if the player elected not to play

  Console_Screen.cls  #Clear the display area

  #Invite the player to return and play again
  puts "Okay, perhaps another time.\n\n"

else  #The player wants to take the test

  #Execute the Test object's display_instructions method
  Typing_Test.display_instructions

  #Display typing challenges and grade each answer by calling on the
  #Test object's present_test method
  Typing_Test.present_test "In the end there can be only one."
  Typing_Test.present_test "Badges? We don't need no stinking badges!"
  Typing_Test.present_test "Once a great plague swept across the land."
  Typing_Test.present_test "I am serious. And don't call me Shirley."
  Typing_Test.present_test "Welcome to Ruby Principles of Ruby Programming"
  Typing_Test.present_test "I'm a mog - half man, half dog. I'm my own " +
  "best friend."
  Typing_Test.present_test "There are very few problems in the world " +
  "that enough M&Ms cannot fix."
  Typing_Test.present_test "Gentlemen, you can't fight in here! This is " +
  "the War Room."
  Typing_Test.present_test "Perhaps today is a good day to die. Fight " +
  "beside me and let us die together."
  Typing_Test.present_test "Roses are red, violets are blue. I'm a " +
  "schizophrenic and so am I."

  #Notify the player of the results by executing the Test object's
  #display_instructions method
  Typing_Test.determine_grade

  Console_Screen.pause       #Pause the game

  Console_Screen.cls  #Clear the display area
  #Thank the player for taking the typing test
  puts "Thank you for taking the Ruby Typing Challenge.\n\n"

end
