#--------------------------------------------------------------------------
#
# Script Name: Crazy8Ball_ExerciseE.rb
# Version:     1.1
# Author:      Corey Hicks
# Date:        18 December 2017
#
# Description: This Ruby script demonstrates how to work with variables. It
# generates random numbers to create a fortune-telling game that provides
# randomly selected answers to the player's questions.
#
#   This program uses 2 classes and several methods and loops to accomplish its
# tasks. First, the Screen class is defined with the cls and pause methods to
# clear the command prompt screen and pause the program until the user hits the
# ENTER key. Second, the Ball class is defined with the get_fortune, say_greeting,
# get_question, tell_fortune, and say_goodbye methods. When called, the get_fortune
# method generates a random number between 1-10 and a case/switch statement is
# used to assign the value of the random number to a $prediction variable.
# Say_greeting, say_goodbye, and tell_fortune methods are simply used to print
# pre-defined string values. Get_question is a method that forces the user to
# input a question before allowing the program to continue. This is accomplished
# by assigning a reply value to null and initializing an until loop that continues
# until the reply value is not equal to null.
#
#   In the main body of the program we start by initializing new Screen and Ball
# objects. First, cls, say_greeting, and pause methods are used to clear the screen,
# say the greeting text, and pause the program for user input. Second, an answer
# variable is initialized with a null value and an until loop is initialized that
# continues until the answer value is either y or n. Third, if the user enters n,
# the cls and say_goodbye methods are called to end the program. However, if the
# user enters y, the program enters an until loop that will continue until the
# user enters q when prompted if they would like to ask another question to break
# the loop. This is done by using an if statement to determine if the answer is
# q or not. Finally, once the until loop is broken, the cls and say_goodbye methods
# are called.
#
#--------------------------------------------------------------------------


# Define custom classes ---------------------------------------------------

#Define a class representing the console window
class Screen

  def cls  #Define a method that clears the display area
    puts ("\n" * 25)  #Scroll the screen 25 times
    puts "\a"  #Make a little noise to get the player's attention
  end

  def pause  #Define a method that pauses the display area
    STDIN.gets  #Execute the STDIN class's gets method to pause script
                #execution until the player presses the Enter key
  end

end

#Define a class representing the 8-Ball
class Ball

  #Define class properties for the 8-Ball
  attr_accessor :randomNo, :greeting, :question, :goodbye

  #Define a method to be used to generate random answers
  def get_fortune
    randomNo = 1 + rand(10)

    #Assign an answer based on the randomly generated number
    case randomNo
      when 1
        $prediction = "It is certain"
      when 2
        $prediction = "Reply hazy, try again"
      when 3
        $prediction = "Don't count on it"
      when 4
        $prediction = "Without a doubt"
      when 5
        $prediction = "Concentrate and ask again"
      when 6
        $prediction = "My sources say no"
      when 7
        $prediction = "You may rely on it"
      when 8
        $prediction = "Ask again later"
      when 9
        $prediction = "Very doubtful"
      when 10
        $prediction = "Outlook is good"
    end

  end

  #This method displays the 8-Ball greeting message
  def say_greeting
    greeting = "\t\t  Welcome to the Virtual Crazy 8-Ball game!" +
    "\n\n\n\n\n\n\t To play: " +
    "\n\t Simply ask any question you desire to have answered and press ENTER." +
    "\n\t The 8-Ball will work its magic to determine your fortune! " +
    "\n\t You may ask as many questions as you like and submit 'q' to end the game." +
    "\n\n\n\n\n\n\nPress Enter to continue. \n\n: "
    print greeting
  end

  #This method displays the 8-Ball's primary query
  def get_question

    reply = ""

    #loop until the player enters something
    until reply != ""
      Console_Screen.cls #Clear the display area

      question = "Type your question and press the Enter key. \n\n: "
      print question

      reply = STDIN.gets #Collect the player's questions
      reply.chop! #Remove any extra characters
    end

  end

  #This method display the 8-Ball answers
  def tell_fortune()
    print "The answer is " + $prediction + ". \n\n: "
  end

  #This method displays the 8-Balls closing message
  def say_goodbye
    goodbye = "Thanks for playing the Virtual Crazy 8-Ball game!\n\n" +
    "By Corey Hicks\n" +
    "https://www.bruin.bellevue.edu"
    puts goodbye
  end

end


# Main Script Logic -------------------------------------------------------

Console_Screen = Screen.new  #Initialize a new Screen object
Eight_Ball = Ball.new  #Initialize a new Ball object

Console_Screen.cls  #Clear the display area

Eight_Ball.say_greeting  #Call method responsible for greeting the player

Console_Screen.pause  #Pause the game


answer = ""  #Initialize variable that is used to control the game's first
             #loop

#Loop until the player enters y or n and do not accept any other input.
until answer == "y" || answer == "n"

  Console_Screen.cls  #Clear the display area

  #Prompt the player for permission to begin the game
  print "Would you like to have your fortune predicted? (y/n)\n\n: "

  answer = STDIN.gets  #Collect the player's response
  answer.chop!  #Remove any extra characters appended to the string

end

#Analyze the player's response
if answer == "n"  #See if the player elected not to play

  Console_Screen.cls  #Clear the display area

  #call upon the method responsible for saying goodbye to the player
  Eight_Ball.say_goodbye

else  #The player has elected to play the game

  #Initialize variable that is used to control the game's primary loop
  gameOver = "No"

  #Loop until the player decides to quit
  until gameOver == "Yes"

    Console_Screen.cls  #Clear the display area

    #Call upon the method responsible for prompting the player to ask a
    #question
    Eight_Ball.get_question

    #Call upon the method responsible for generating an answer
    Eight_Ball.get_fortune

    Console_Screen.cls  #Clear the display area

    #Call upon the method responsible for telling the player the 8-Ball's
    #answer
    Eight_Ball.tell_fortune

    Console_Screen.pause  #Pause the game

    Console_Screen.cls  #Clear the display area

    #Find out if the player wants to ask another question
    print "Press Enter to ask another question or type q to quit. \n\n: "

    answer = STDIN.gets  #Collect the player's response
    answer.chop!  #Remove any extra characters appended to the string

    #Analyze the player's response
    if answer == "q"  #See if the player elected not to play
      gameOver = "Yes"  #The player wants to quit
    end

  end

  Console_Screen.cls  #Clear the display area

  #call upon the method responsible for saying goodbye to the player
  Eight_Ball.say_goodbye

end
