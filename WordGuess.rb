#--------------------------------------------------------------------------
# 
# Script Name: WordGuess.rb
# Version:     1.0
# Author:      Jerry Lee Ford, Jr.
# Date:        April 2010
# 
# Description: This Ruby script demonstrates how to work with regular
#              expressions through the development of a computer game 
#              that challenges the player to guess a mystery word after 
#              being first allowed to guess 5 consonants and 1 vowel.
#
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
                #execution until the player presses the Enter key
  end
  
end

#Define a class representing the Word Guessing Game
class Game
 
  #This method displays the game's opening message
  def display_greeting
  
    Console_Screen.cls  #Clear the display area
  
    #Display welcome message
    print "\t\t\tWelcome to the Word Guessing Game!" +
    "\n\n\n\n\n\n\n\n\n\n\n\n\n\nPress Enter to " +
               "continue."
  
    Console_Screen.pause       #Pause the game

  end
 
  #Define a method to be used to present game instructions
  def display_instructions
    
    Console_Screen.cls       #Clear the display area
    puts "INSTRUCTIONS:\n\n"  #Display a heading

    #Display the game's instructions
    puts "At the start of each round of play, the game randomly selects"
    puts "a word that is between five and ten characters long and"
    puts "challenges you to guess it. Before submitting your guess, you"
    puts "must specify five consonants and one vowel. If any of these"
    puts "are used in the word, they will be revealed on the screen,"
    puts "thereby making it easier for you to guess the secret word.\n\n"
    puts "Good luck!\n\n\n\n\n\n\n\n\n"
    print "Press Enter to continue."

    Console_Screen.pause       #Pause the game
    
  end
 
  #Define a method that generates the secret word
  def select_word
  
    #Define an array of 20 words from which the game will randomly select
    words = ["W I N D O W", "S T A T I O N", "H A M B U R G E R",
             "E X P R E S S I O N", "W A L L E T", "C A M E R A",
             "A I R P L A N E", "C A N D L E", "C O M P U T E R",
             "P I C T U R E", "F R A M E", "S H E L F", "B O W L I N G",
             "P O L I T E", "S T A T E M E N T", "N E G A T I V E",
             "M E T H O D", "F I S H I N G", "C O M P E N S A T E",
             "H A P P Y"]
  
    #Generate and return a random number between 0 and 19
    randomNo = rand(19)
  
    #Return a randomly selected word to the calling statement
    return words[randomNo]  
    
  end
 
  #Define a method that collects the player's consonant guesses
  def get_consonants
  
    list = Array.new  #Define an array in which to store the consonants
   
    #Give the player an idea of what is coming
    puts "Before you try to guess the secret word, you must specify " +
         "5 consonants.\n\n"
    print "Press Enter to continue."
  
    Console_Screen.pause      #Pause the game
  
    5.times do  #Iterate 5 times
    
      Console_Screen.cls       #Clear the display area
    
      #Prompt the player to enter a consonant
      print "\nPlease enter a consonant and press Enter. "
    
      input = STDIN.gets  #Collect the player's input
      input.chop!         #Remove the end of line marker
      
      #Only accept consonant characters
      if input !~ /[bcdfghjklmnpqrstvwxyz]/i then
        Console_Screen.cls       #Clear the display area
        print "Error: " + input + " is not a consonant. Press Enter to " +
        "continue."
        Console_Screen.pause      #Pause the game
        redo  #Repeat the current iteration of the loop
      end
      
      #Only accept one character of input per guess
      if input.length > 1 then
        Console_Screen.cls       #Clear the display area
        print "Error: You may only enter one character at a time. Press " +
        "Enter to continue."
        Console_Screen.pause      #Pause the game
        redo  #Repeat the current iteration of the loop
      end
      
      #Do not allow the player to submit the same guess twice
      if list.include?(input.upcase) == true then
        Console_Screen.cls       #Clear the display area
        print "Error: You have already guessed " + input + ". Press " +
        "Enter to continue."
        Console_Screen.pause      #Pause the game
        redo  #Repeat the current iteration of the loop
      else
        list.push(input.upcase)  #Convert the consonant to uppercase and 
      end                        #add it to the list of consonants
 
    end
   
    return list  #Return the list of consonants to the calling statement
    
  end
 
  #Define a method that collects the player's vowel guesses
  def get_vowel
  
    #Give the player an idea of what is coming
    puts "Before you try to guess the secret word, you must specify " +
    "1 vowel.\n\n"
  
    1.times do  #Iterate 1 time
      
      Console_Screen.cls       #Clear the display area     
      
      #Prompt the player to enter a vowel
      print "\nPlease enter a vowel and press Enter. "
      input = STDIN.gets  #Collect the player's input
      input.chop!         #Remove the end of line marker
      
      #Only accept vowel characters
      if input !~ /[aeiou]/i then
        Console_Screen.cls       #Clear the display area
        print "Error: " + input + " is not a vowel. Press Enter to " +
        "continue."
        Console_Screen.pause      #Pause the game
        redo  #Repeat the current iteration of the loop
      end
      
      #Only accept one character of input per guess
      if input.length > 1 then
        Console_Screen.cls       #Clear the display area
        print "Error: You may only enter one character at a time. Press " +
        "Enter to continue."
        Console_Screen.pause      #Pause the game
        redo #Repeat the current iteration of the loop
      end
      
      input = input.upcase  #Convert the vowel to uppercase
      return input  #Return the vowel to the calling statement
      
    end
  
  end
 
  #Define a method that collects player guesses
  def prompt_for_guess(shortWord, word, consonants, vowel)
  
    Console_Screen.cls       #Clear the display area
   
    consonants.push(vowel)  #To make things easy, add the vowel to the 
                            #list of consonants

    wordArray = word.split(" ") #Split the secret word into an array
  
    i = 0  #Initialize index variable to zero 

    #Loop once for each letter in the word (stored in an array)
    wordArray.each do |letter| 
    
      match = false  #Initialize the variable with a starting value of false 
    
      #Loop once for each consonant stored in the consonants array
      consonants.each do |character|
        
        #Compare the current character from the consonants array to the
        #current letter in the wordArray array        
        if character == letter then
          match = true  #Set variable value to indicate a match
          break  #Terminate loop execution when a match occurs
        end
   
      end

      #If there is no matching character in the consonants array for the 
      #current letter in the wordArray array, replace that letter in the
      #wordArray with an underscore character
      if match == false then
        wordArray[i] = "_"  #Replace the current character with an
      end                   #underscore
  
      i = i + 1  #Increment the variable's value by 1

    end

    #Once the contents of the array have been formatted with underscores,
    #convert the contents of the array back into a word
    word = wordArray.join(" ")

    #Allow the player up to three guesses
    3.times do |i|  #i equals 0 on the first iteration of the loop
        
      Console_Screen.cls       #Clear the display area
    
      #Prompt the player to try to guess the secret word
      puts "I am thinking of a word.\n\n\n\n\n\n"
      print "Here is your clue:  " + word + "\n\n\n\n\n\n\n\n"
      print "What do you think this word is?  "
      reply = STDIN.gets  #Collect the player's reply
      reply.chop!         #Remove the end of line marker
      reply = reply.upcase  #Convert the reply to all uppercase
      
      #Analyze the players guess
      if reply == shortWord then  #The player's guessed the secret word
      
        Console_Screen.cls       #Clear the display area
        print "Correct! Press Enter to continue."
        Console_Screen.pause       #Pause the game
        break  #Terminate the execution of the loop
        
      else  #The player did not guess the secret word
      
        Console_Screen.cls       #Clear the display area
        
        #Display a message based on how many turns remain
        if i == 1 then 
          print "Wrong! You have one guess left. Press Enter to " +
          "try again."
        elsif i == 2
          print "Sorry, you lose.\n\n"
          print "The word was " + shortWord + ". Press Enter to continue."
        else
          print "Wrong! Press Enter to try again."
        end 
        
        Console_Screen.pause       #Pause the game
        
      end 
       
    end
    
  end

  #Define a method to control game play
  def play_game

    word = select_word  #Call on the method that retrieves a random word

    Console_Screen.cls       #Clear the display area
    
    consonants = get_consonants #Call on the method that prompts the player
                                #to enter a list of consonants

    Console_Screen.cls       #Clear the display area
      
    #Call on the method that prompts the player to enter a vowel
    vowel = get_vowel 
    
    #Remove blank spaces from the word to create a short version of the word
    shortWord = word.gsub(" ", "")

    #Call the method that processes player guesses
    prompt_for_guess(shortWord, word, consonants, vowel)
      
    Console_Screen.cls       #Clear the display area

  end

  #This method displays the information about the Word Guessing game
  def display_credits
  
    Console_Screen.cls  #Clear the display area
  
    #Thank the player and display game information
    puts "\t\t     Thank you for playing the Word Guessing Game.\n\n\n\n"
    puts "\n\t\t\t Developed by Jerry Lee Ford, Jr.\n\n"
    puts "\t\t\t\t  Copyright 2010\n\n"
    puts "\t\t\tURL: http://www.tech-publishing.com\n\n\n\n\n\n\n\n\n\n"

  end

end


# Main Script Logic -------------------------------------------------------

Console_Screen = Screen.new  #Instantiate a new Screen object
WordGuess = Game.new         #Instantiate a new Game object

#Execute the Game class's display_greeting method
WordGuess.display_greeting

answer = ""  #Initialize variable and assign it an empty string

#Loop until the player enters y, n, Y, or N and do not accept any 
#other input
loop do

  Console_Screen.cls  #Clear the display area

  #Prompt the player for permission to start the game
  print "Are you ready to play the Word Guessing Game? (y/n): "

  answer = STDIN.gets  #Collect the player's answer
  answer.chop!  #Remove the new line character appended to the 
                #string

  #Terminate the loop if valid input was provided
  break if answer =~ /y|n/i  #Accept upper or lower case input

end 

#Analyze the player's input
if answer == "n" or answer == "N" #See if the player elected not
                                  #to play the game

  Console_Screen.cls  #Clear the display area

  #Invite the player to return and play the game some other time
  puts "Okay, perhaps another time.\n\n"

else  #The player wants to play the game

    #Execute the game class's display_instructions method
    WordGuess.display_instructions

  loop do  #Loop forever
    
    #Execute the Game class's play_game method
    WordGuess.play_game

    #Find out if the player wants to play another round
    print "Enter Q to quit or press any key to play again: "

    playAgain = STDIN.gets  #Collect the player's response
    playAgain.chop!  #Remove the new line character appended to the 
                     #string
  
    #Terminate the loop if valid input was provided
    break if playAgain =~ /Q/i 
  
  end
  
  #Call upon the Game class's display_credits method
  WordGuess.display_credits
  
end
