######
# Exercise 2, HW1
# Each time exercise2.rb is run from the command line it displays a random fortune.
# Eugene Wolfson
# No preconditions
# At the prompt in the containing folder enter:
#  > ruby exercise2.rb 
######

# Holds a list of fortunes and can return a random fortune
class Fortune
  
  FORTUNES = ["You will learn Ruby soon", "You will get an A for this course", "The Redsox will win the superbowl", "You will come to class on time", "You will meet a nice person tomorrow, but they'll disappoint you soon.", "There's always time for love, friends, and books."]

  # returns a random fortune from FORTUNES. 
  # For an instance of this method, repeat calls to this method may return the same fortune as before.
  def next_fortune
    FORTUNES[(rand * FORTUNES.length).to_int]
  end
  
  # returns a random fortune from FORTUNES. 
  # For an instance of this method, repeat calls to this method will not return a repeat fortune until all fortunes have been called at least once.
  def next_fortune!
    @fortunes ||= FORTUNES
    # puts "@fortunes = #{@fortunes.join(', ')}" #debugging    
    fortune = next_fortune while @fortunes.delete(fortune).nil? 
    return fortune    
  end
end

# Prints two random (nonrepeating) fortunes, if this file is the top-level program 
#       (which it is, if invoked as described in the header.)
# $0 is the name of the top-level Ruby program being executed, also aliased as $PROGRAM_NAME
# __FILE__ is the name of the current source file.
if __FILE__ == $0 
  f = Fortune.new
  puts f.next_fortune!
  puts f.next_fortune!
end

