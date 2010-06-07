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
  DEFAULT_LIVES = 6
  PLACEHOLDER = '_' #TODO: should this be a constant, or a local variable within play method?
  INITIAL_MOVES=('a'..'z').to_a

  def initialize 
    @dict ||= [] #TODO: Add loading of dictionary.
    play(DEFAULT_LIVES) 
    
  end

  # The computer plays one game of Hangman with lives number of guesses, against the player
  def play(lives)
    
    #Initialize
    print "Computer asks how many letter in the phrase: "
    until (word_length = gets).respond_to?(:to_i) && word_length.to_i > 0 do
      print "Input an integer greater than zero: "
    end

    word = Array.new(word_length.to_i,PLACEHOLDER) # initially, word is array of space delimited underscores
    
    # plays a turn each iteration of the loop
    @lives = lives
    while @lives > 0 && word.include?(PLACEHOLDER)
      
      # Show current state
      print_state(word)


      # Make move and set new state
      move = make_move!
      puts %Q{\n\nComputer guesses \"#{move}\".}

      
      # Set new state
      print %Q{User says that \"#{move}\" occurs in position: }
      positions = gets.chomp.split( /,\s*|\s+/ ).collect{|p| p.to_i if (1..word.length)=== p.to_i}.compact #extract valid positions by spaces or commas
      if positions.empty?
        @lives -= 1
      else #set positions
        positions.each{|i| word[i-1]=move}
      end
      
    end

    puts #newline
    if @lives > 0
      puts "Computer guessed correctly!"
    else
      verify_word(word)
    end
    
  end

  # Prints the state of the game in a user-friendly manner
  # Space delimited word, with index markers, lives left.
  def print_state(word)
    
    spacing = Math.log10(word.length).to_i + 2 # there should be enough spaces so that the index fits under each letter of the word

    # print characters of word, with spaces
    print "\n"
    word.each{|ch|              print sprintf("%-#{spacing}.1s", ch)}
    print "\n"

    # followed by indices with matching spacing
    word.length.times{|index|   print sprintf("%-#{spacing}.0f", index+1)}
    print "\n" 

    puts "And there are #{@lives} lives left."
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
  def verify_word(word)
    guessed_chars = INITIAL_MOVES - @moves 
    puts "Computer guessed: #{guessed_chars}" #Note that I'm setting guessed chars within the string
    
    print "Computer failed. What was the word? "
    correct_word = gets.chomp

    #TODO: Can I easily substitute the string, "I think you made a mistake," to the beggining of the reason why the user made a mistake?
    if /[^a-z]/i =~ correct_word.downcase
      puts "I think you made a mistake, '#{correct_word}' has non-alphabetic letters."
    elsif correct_word.length != word.length
      puts "I think you made a mistake, '#{correct_word}' is not #{word.length} letter(s)."
    elsif correct_word.count(guessed_chars.join) == correct_word.length
      puts "I think you made a mistake, I guessed all the letters of '#{correct_word}'."
    end
    
  end
end

if __FILE__ == $0
  h = Hangman.new
end
