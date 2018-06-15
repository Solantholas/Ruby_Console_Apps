#--------------------------------------------------------------------------
#
# Script Name: TallTale.rb
# Version:     1.0
# Author:      Corey Hicks
# Date:        17 December 2017
#
# Description: This Ruby script demonstrates how to collect and process
# user input through the development of an interactive storytelling game. First,
# the Screen and Tale classes are defined with accessors and methods. Second, a
# do loop is initialized to prompt the user to choose yes or no to continue. A
# sentry is also used to only allow the do loop to break if the user properly
# enters y or n. Third, an if/else statement is used to determine if the program
# should end or continue based on the user input. Finally, the story runs by
# prompting user input before displaying the story paragraphs and final notes.
#
#
#--------------------------------------------------------------------------


# Define custom classes ---------------------------------------------------

#Define a class representing the console window
class Screen

  def cls  #Define a method that clears the display area
    puts ("\n" * 25)  #Scroll the screen 25 times
    puts "\a"  #Make a little noise to get the player's attention
  end

end

#Define a class representing the game's story
class Tale

  #Define class properties representing story elements
  attr_accessor :monster, :villain, :object, :place, :location

  #Define class properties representing story paragraphs
  attr_accessor :P1, :P2, :P3, :P4, :P5

  #Define a method to be used to display story paragraphs
  def tell_Story(paragraph)
    puts paragraph
  end

end


# Main Script Logic -------------------------------------------------------

Console_Screen = Screen.new  #Initialize a new Screen object

#Execute the Screen object's cls method in order to clear the screen
Console_Screen.cls

#Prompt the player for permission to begin the game
print "Would you like to hear an interesting story? (y/n)\n\n: "

loop do
  #Execute the Screen object's cls method in order to clear the Screen
  Console_Screen.cls

  #Prompt the player for permission to begin the game
  print "Would the player like to hear an interesting story?" + "(y/n)\n\n: "

  $answer = STDIN.gets #Collect the player's response
  $answer.chomp! #Remove any extra characters appended to the string

  break if $answer == "y" || $answer == "n"

end

#Analyze the player's response
if $answer == "n"  #See if the player elected not to play

  Console_Screen.cls  #Clear the display area

  #Invite the player to return and play again
  puts "Okay, perhaps another time.\n\n"

else

  Story = Tale.new  #Instantiate a new story object

  ###############################################
  # It is time to start collecting player input #
  ###############################################

  Console_Screen.cls  #Clear the display area

  #Prompt the player to provide some input
  print %Q{Name a new type of a scary monster. (Press Enter)\n\n: }
  monster = STDIN.gets  #Force the player to press Enter to continue
  monster.chomp!  #Remove any extra characters appended to the string

  Console_Screen.cls  #Clear the display area

  #Prompt the player to provide some input
  print %Q{Who is your favorite movie star? (Press Enter)\n\n: }
  villain = STDIN.gets  #Force the player to press Enter to continue
  villain.chomp!  #Remove any extra characters appended to the string

  Console_Screen.cls  #Clear the display area

  #Prompt the player to provide some input
  print %Q{What is your name? (Press Enter)\n\n: }
  player = STDIN.gets  #Force the player to press Enter to continue
  player.chomp!  #Remove any extra characters appended to the string

  Console_Screen.cls  #Clear the display area

  #Prompt the player to provide some input
  print %Q{Type in the name of a thing. (Press Enter)\n\n: }
  object = STDIN.gets  #Force the player to press Enter to continue
  object.chomp!  #Remove any extra characters appended to the string

  Console_Screen.cls  #Clear the display area

  #Prompt the player to provide some input
  print %Q{Enter the name of a good hiding place. (Press Enter)\n\n: }
  place01 = STDIN.gets  #Force the player to press Enter to continue
  place01.chomp!  #Remove any extra characters appended to the string

  Console_Screen.cls  #Clear the display area

  #Prompt the player to provide some input
  print %Q{Enter the name of another good hiding place. (Press Enter)\n\n: }
  place03 = STDIN.gets  #Force the player to press Enter to continue
  place03.chomp!  #Remove any extra characters appended to the string

  Console_Screen.cls  #Clear the display area

  #Prompt the player to provide some input
  print %Q{Enter the name of a good sanctuary. (Press Enter)\n\n: }
  place02 = STDIN.gets  #Force the player to press Enter to continue
  place02.chomp!  #Remove any extra characters appended to the string

  Console_Screen.cls  #Clear the display area

  #Prompt the player to provide some input
  print %Q{Enter the name of popular vacation site. (Press Enter)\n\n: }
  location = STDIN.gets  #Force the player to press Enter to continue
  location.chomp!  #Remove any extra characters appended to the string

  Console_Screen.cls  #Clear the display area

  #Prompt the player to provide some input
  print %Q{Enter a number of years. (Press Enter)\n\n: }
  slumberYears = STDIN.gets  #Force the player to press Enter to continue
  slumberYears.chomp!  #Remove any extra characters appended to the string

  Console_Screen.cls  #Clear the display area

  #Prompt the player to provide some input
  print %Q{Enter the name of something you spray. (Press Enter)\n\n: }
  spray = STDIN.gets  #Force the player to press Enter to continue
  spray.chomp!  #Remove any extra characters appended to the string

  Console_Screen.cls  #Clear the display area

  #Transitional statement to let the player know the story is about to begin.
  print %Q{Thanks for all your help! Now, sit back, relax, and enjoy the story
  that you helped me create! (Press Enter)\n\n: }
  transition = STDIN.gets
  transition.chomp!

  ###############################################
  # It is time to start telling the story       #
  ###############################################

  #Display the first paragraph of the story
  Story.P1 = %Q{  Once upon a time in a far away land just on the
  outskirts of #{location}, there lived three very brave young children
  named #{player}, William and Molly. These children were known far and
  wide as the heroes who once saved the inhabitants of #{location} from
  an evil #{monster}. One day dark clouds descended over #{location}.
  For 5 nights and 5 days a great storm raged, flooding all of the land
  in #{location}, driving its inhabitants up into the #{place02}. (Press Enter)

  }

  #Display the second paragraph of the story
  Story.P2 = %Q{  The good people of #{location} were not the only ones
  driven into the #{place02}. An evil #{monster} named #{villain} was also awoken
  from a #{slumberYears} year slumber and forced from its #{place03} by the torrential
  floods that followed the storm into #{location}. #{villain}, having
  been asleep for so long was now hungry and soon began to prey upon the
  helpless people. By the time the water began to recede, over half of
  the inhabitants had become meals for #{villain}. (Press Enter)

  }

  #Display the third paragraph of the story
  Story.P3 = %Q{  Desperate for help, the remaining inhabitants of
  #{location} sent word to #{player}, William, and Molly that their help
  was once again needed. The three children soon arrived upon the scene
  only to find that #{villain} had cornered the last of the inhabitants
  inside a #{place01} and was preparing to eat one last meal before
  returning to his secret #{place03} in #{location}. (Press Enter)

  }

  #Display the fourth paragraph of the story
  Story.P4 = %Q{  Immediately, #{player}, William and Molly flew into
  action. #{player} threw a #{object} and hit #{villain} in order to get
  his attention. At the same time William and Molly crept up behind him.
  William then threw a rope around the feet of #{villain}, momentarily
  tying him up and allowing Molly to move in and spray #{villain} with
  a full can of #{spray} spray, immediately immobilizing and killing
  #{villain}. The remaining inhabitants returned to their homes and soon
  life in #{location} was back to normal. #{player}, William and Molly
  returned to their homes, quietly living on the edge of #{location},
  waiting until the day they would be needed again. (Press Enter)

  }

  #Display the fifth paragraph of the story
  Story.P5 = %Q{  My name is Corey Hicks. I have been studying programming for
  the last 4 years. I've always dreamed of working as a game designer, and I
  hope this introductory game has been enjoyable for you. Mad libs are some of
  my fondest elementary school memories, and it's a great honor to provide your
  with this little gem. By having you answer the beginning questions, you get to
  add a small bit of programming to this game. I hope this game is able to spark
  some creativity and inspires you to follow my dream of programming. (Press Enter)

  }

  Console_Screen.cls  #Clear the display area
  Story.tell_Story Story.P1    #Tell the story's first paragraph
  STDIN.gets  #Force the player to press Enter to continue

  Console_Screen.cls  #Clear the display area
  Story.tell_Story Story.P2    #Tell the story's second paragraph
  STDIN.gets  #Force the player to press Enter to continue

  Console_Screen.cls  #Clear the display area
  Story.tell_Story Story.P3    #Tell the story's third paragraph
  STDIN.gets  #Force the player to press Enter to continue

  Console_Screen.cls  #Clear the display area
  Story.tell_Story Story.P4   #Tell the story's fourth paragraph
  STDIN.gets  #Force the player to press Enter to continue

  Console_Screen.cls  #Clear the display area
  Story.tell_Story Story.P5   #Tell the story's fourth paragraph
  STDIN.gets  #Force the player to press Enter to continue

  Console_Screen.cls  #Clear the display area
  puts "Thanks for helping to tell this Tall Tale!\n\n"

end

#Invite the player to return and play again
puts "Okay, perhaps another time.\n\n"
