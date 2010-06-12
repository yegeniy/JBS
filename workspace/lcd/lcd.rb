

# A sequence of digits is printed by concatenating the lines of all digits (TODO: later implement concatenation from the top-down to support different sized digits)

class Lcd
# BASE_LCD_DIGITS = ["|"]
  
  # Import a list of all digits
  # Set numbers to display
  def initialize#(*args=ARGV)
    args = ARGV
    puts "args are"
    puts args.inspect
    size ||= 1
    numbers ||= []
    
    #convert to strings
    size = args[0].to_i

    if args[0] == "-s" &&  args[1].to_i.floor > 0
      #puts "setting size"
      size = args[1].to_i.floor
      extract_digits(args[2]) 
    else 
      extract_digits(args[0])
    end
  end

  def extract_digits arg
    @digits = arg.to_s.scan(/\d/).map{|i| i.to_i}
    raise Exception if digits.empty? #TODO: Handle exception
  end

  # Collect each digit as an lcd representation
  # convert each line to be default width, by filling it with white space to that point.
  # scale each digit to desired width
  # combine each line of each digit
  def print_lcd
    #puts @numbers
    #puts BASE_LCD_DIGITS[0]
    @digits.collect
  end

end

# Each digit is represented as an array of at least 5 lines.
class Lcd_Digit
  DEFAULT_DIGIT_HEIGHT = 5
  # In a file, search for the digit, then extract the next 5 lines, which represent the digit as a size one lcd object\
  # digit can't be "|" or "-"
  def find_lcd_representation(digit)
    
    file.Open('lcd_digits.txt', "r") do |f|
      
      redo until f.readline.match(/#{digit}/)
      
      DEFAULT_DIGIT_HEIGHT.times.collect{ f.readline }
      
    end
  end
end

if __FILE__ == $0
  a = Lcd.new
  print_as_lcd(a)
end
/
