######
# Hangman, HW3
# A computer guesses against a human player in a game of hangman.
#  The first player picks a word or phrase, and the second player has to guess it a letter at a time. 
#  If they make six wrong guesses (i.e. the target word does not contain the guessed letter), they lose.
#  If they guess the entire word before then, they win. 
# No preconditions to running
# > ruby hangman
######


# Plays a game of Hangman. 
# Currently a player plays with the computer
class Hangman
  
  attr_reader :word, :lives, :dict #TODO: might not need lives here
  DEFAULT_LIVES = 5
  PLACEHOLDER = '_ ' #TODO: should this be a constant, or a local variable in play?
  INITIAL_MOVES=('a'..'z').to_a

  def initialize 
    @dict ||= [] #TODO: Add loading of dictionary.

    play(DEFAULT_LIVES) 
    
  end

  # The computer plays one game of Hangman with lives number of guesses, against the player
  def play(lives)
    
    #Initialize
    puts "Computer asks how many letter in the phrase: "
    until (word_length = gets).respond_to?(:to_i) && word_length.to_i > 0 do
      print "Input an integer greater than zero: "
      next
    end
    word = Array.new(word_length.to_i,PLACEHOLDER) # initially, word is array of space delimited underscores
    
    # plays a turn each iteration of the loop
    @lives = lives
    while @lives > 0 && word.include?(PLACEHOLDER)
      
      # Show current state
      print "\n",  word, "\n"
      puts (1..word.length).to_a.join( ' ' )#(word.length - 1).times{ |i| print (i+1), " "} #letter position
      puts "there are #{@lives} lives left."

      # Make move and set new state
      move = make_move!
      puts %Q{\n\nComputer guesses \"#{move}\".}

     
      # Set new state
      print %Q{User says that \"#{move}\" occurs in position: }
      positions = gets.chomp.split( /,\s*|\s+/ ).collect{|p| p.to_i if (1..word.length)=== p.to_i}.compact #extract numbers
      if positions.empty?
        @lives -= 1
      else
        positions.each{|i| p  word[i-1]=move+" "}
      end
      puts "INITIAL_MOVES = #{  INITIAL_MOVES}"
    end

    if @lives > 0
      puts "Computer guessed correctly!"
    else
      puts "Computer failed. What was the word? "
      correct_word = gets.chomp
      verify_word(correct_word)
    end
    
  end

  private

  #guesses a letter, unique to this instance of the game.
  def make_move!
    @moves ||= INITIAL_MOVES.dup #Initialize if necessary
    
    if @moves.empty? #TODO: throw an exception instead
      puts "The computer has already guessed all the letters in the alphabet" 
      break
    end
     
    @moves.delete(@moves[rand(@moves.length)]){ puts "Error in make_move!: guessed letter not found" } # return and remove a random letter. Message is just for debugging

  end

  # makes sure that the user supplied word wasn't guessed by the computer
  # FIXME: Check that there exists a character in the correct word that wasn't guessed.
  def verify_word(correct_word)
    #    puts "INITIALMOVES = #{INITIAL_MOVES} \n moves = #{@moves}"
    #    puts "guessed chars are: #{(guessed_chars = INITIAL_MOVES - @moves)}"
    puts "I think you made a mistake, I guessed all the letters in that word!" if correct_word.count(guessed_chars.join) == correct_word.length
  end

end



if __FILE__ == $0
  h = Hangman.new
end
