#--------------------------------------------------------------------------
#
# Script Name: BlackJack.rb
# Version:     1.1
# Author:      Corey Hicks
# Date:        18 February 2018
#
# Description: This Ruby game is a computerized version of the casino card
#              game in which the player competes against the dealer (i.e.,
#              computer) in an effort to build a hand that comes as close
#              as possible to 21 without going over.
#
#   This program introduces file reading/writing and the ability to determine
# which platform Ruby is running on. We start this week by removing the display
# methods in favor of using text file calls. This is accomplished in the
# get_file and retrieve_files methods. First, the RUBY_PLATFORM method is called
# to determine which platform Ruby is running on (either a windows or
# Unix/Linux platform). Based on which platform is being used, the program
# retrieves and assigns the credits, help, and welcome files to global
# variables. Accessors assign corresponding text values to the get_file method
# to display the correct file information when the program is ran.
#
#   write_log_file method creates a new log file, if one doesn't already exist,
# in the correct temp folder of the system running the program (RUBY_PLATFORM is
# called to accomplish this). After the file is written to the temp file, a log
# is kept of the final card score and outcome of each consecutive blackjack
# game played. However, the remove_log_file method will delete the log file in
# the temp folder after the game is closed out.
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
                #execution until the player presses the enter key
  end

end

#Define a class representing the Ruby Blackjack game
class Game

  #Define a method to be used access passed in text file names
  def get_file(fileName)

    Console_Screen.cls       #Clear the display area

    #If statements to determine which file to display
    if fileName == "Help" then
      print $help_file
    end
    if fileName == "Welcome" then
      print $welcome_file
    end
    if fileName == "Credits" then
      print $credits_file
    end

    Console_Screen.pause       #Pause the game

  end

  #Define a method to retrieve text files
  def retrieve_files

    #Determine which platform the game is running on
    if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/ then
      #Retrieve files and assign to global variable
      $help_file = File.read('C:\Ruby22\Ruby_Apps\myApp\BJHelp.txt')
      $welcome_file = File.read('C:\Ruby22\Ruby_Apps\myApp\BJWelcome.txt')
      $credits_file = File.read('C:\Ruby22\Ruby_Apps\myApp\BJCredits.txt')
    else
      $help_file = File.read('/Ruby22/Ruby_Apps/myApp/BJHelp.txt')
      $welcome_file = File.read('/Ruby22/Ruby_Apps/myApp/BJWelcome.txt')
      $credits_file = File.read('/Ruby22/Ruby_Apps/myApp/BJCredits.txt')
    end

  end

  def write_log_file(message)

    #Determine which platform the game is running on
    if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i then
      #Open the log file in append mode
      outFile = File.new('C:\temp\BJLog.txt', "a")
      outFile.puts message                          #Write a line of text
      outFile.close                                 #Close the log file

    else
      outFile = File.new('/tmp/BJLog.txt', "a")
      outFile.puts message                          #Write a line of text
      outFile.close                                 #Close the log file
    end

  end

  #This method remove the game's log file
  def remove_log_file

    #Determine which platform the game is running on
    if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i then
      #Delete the log file only if it exists
      if File.exist?('C:\temp\BJLog.txt') then
        File.delete('C:\temp\BJLog.txt')
      end

    else
      if File.exist?('/tmp/BJLog.txt') then
        File.delete('/tmp/BJLog.txt')
      end
    end

  end

  #Define a method to control game play
  def play_game

    Console_Screen.cls       #Clear the display area

    #Assign the player and dealer an initial starting card
    playerHand = get_new_card
    dealerHand = get_new_card

    #Call the method responsible for dealing new cards to the player
    playerHand = complete_player_hand(playerHand, dealerHand)

    #If the player has not gone bust, call the method responsible for managing
    #dealer's hand
    if playerHand <= 21 then
      dealerHand = play_dealer_hand(dealerHand)
    end

    #call the method responsible for determining the results of the game
    determine_winner(playerHand, dealerHand)

  end

  #Define a method responsible for dealing a new card
  def get_new_card

    #Assign a random number between 1 and 13 as the value of the card being
    #created
    card = 1 + rand(13)

    #A value of 1 is an ace, so reassign the card a value of 11
    return 11 if card == 1

    #A value of 10 or more equals a face card so reassign the card a value
    #of 10
    return 10 if card >= 10

    return card  #Return the value assigned to the new card

  end

  #Define a method responsible for dealing the rest of the player's hand
  def complete_player_hand(playerHand, dealerHand)

    loop do  #Loop forever

      Console_Screen.cls  #Clear the display area

      #Show the current state of the player and dealer's hands
      puts "Player's hand: " + playerHand.to_s + "\n\n"
      puts "Dealer's hand: " + dealerHand.to_s + "\n\n\n\n\n\n"
      print "Would you like another card? (Y/N) "

      reply = STDIN.gets  #Collect the player's answer
      reply.chop!  #Remove any extra characters appended to the string

      #See if the player decided to ask for another card
      if reply =~ /y/i then
        #Call method responsible for getting a new card and add it to the
        #player's hand
        playerHand = playerHand + get_new_card
      end

      #See if the player has decided to stick with the current hand
      if reply =~ /n/i then
        break  #Terminate the execution of the loop
      end

      if playerHand > 21 then
        break  #Terminate the execution of the loop
      end

    end

    #Return the value of the player's hand
    return playerHand

  end

  #Define a method responsible for managing the dealer's hand
  def play_dealer_hand(dealerHand)

    loop do  #Loop forever

      #If the value of the dealer's hand is less than 17 then give the
      #dealer another card
      if dealerHand < 17 then
        #Call method responsible for getting a new card and add it to the
        #dealer's hand
        dealerHand = dealerHand + get_new_card
      else
        break  #Terminate the execution of the loop
      end

    end

    #Return the value of the dealer's hand
    return dealerHand

  end

  #Define a method responsible for analyzing the player and dealer's
  #hands and determining who won
  def determine_winner(playerHand, dealerHand)

    Console_Screen.cls  #Clear the display area

    #Show the value of the player and dealer's hands
    puts "Player's hand: " + playerHand.to_s + "\n\n"
    puts "Dealer's hand: " + dealerHand.to_s + "\n\n\n\n\n\n"
    write_log_file("Player's hand: " + playerHand.to_s)
    write_log_file("Dealer's hand: " + dealerHand.to_s)

    if playerHand > 21 then  #See if the player has gone bust
      puts "You have gone bust!\n\n"
      write_log_file("The Player has gone bust.")
      print "Press Enter to continue."
    else  #See if the player and dealer have tied
      if playerHand == dealerHand then
          puts "Tie!\n\n"
          write_log_file("Tie!")
          print "Press Enter to continue."
        end
      #Dee if the dealer has gone bust
      if dealerHand > 21 then
          puts "The Dealer has gone bust!\n\n"
          write_log_file("The Dealer has gone bust.")
          print "Press Enter to continue."
      else
        #See if the player's hand beats the dealer's hand
        if playerHand > dealerHand then
          puts "You have won!\n\n"
          write_log_file("The Player has won!")
          print "Press Enter to continue."
        end
        #See if the dealer's hand beats the player's hand
        if playerHand < dealerHand then
          puts "The Dealer has won!\n\n"
          write_log_file("The Dealer has won!")
          print "Press Enter to continue."
        end
      end
    end

    write_log_file("-" * 50)
    Console_Screen.pause       #Pause the game

  end

end


# Main Script Logic -------------------------------------------------------

Console_Screen = Screen.new  #Instantiate a new Screen object
BJ = Game.new  #Instantiate a new Game object

#Calls the retrieve_files method
BJ.retrieve_files

#Calls the get_file method and passes the welcome value
BJ.get_file("Welcome")

answer = ""  #Initialize variable and assign it an empty string

#Loop until the player enters y or n and do not accept any other input
loop do

  Console_Screen.cls  #Clear the display area

  #Prompt the player for permission to start the game
  print "Are you ready to play Ruby Blackjack? (y/n): "

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

  #Calls the remove_log_file method
  BJ.remove_log_file

  #Calls the get_file method and passes the help value
  BJ.get_file("Help")

  playAgain = ""  #Initialize variable and assign it an empty string

  loop do  #Loop forever

    #Execute the Game class's play_game method
    BJ.play_game

    loop do  #Loop forever

      Console_Screen.cls  #Clear the display area
      #Find out if the player wants to play another round
      print "Would you like to play another hand? (y/n): "

      playAgain = STDIN.gets  #Collect the player's response
      playAgain.chop!  #Remove any extra characters appended to the string

      #Terminate the loop if valid input was provided
      break if playAgain =~ /n|y/i

    end

    #Terminate the loop if valid input was provided
    break if playAgain =~ /n/i

  end

  #Calls the get_file method and passes the credits value
  BJ.get_file("Credits")

end
