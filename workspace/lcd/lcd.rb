class Lcd


    BASE_LCD_DIGITS = ["|"]
  
  # Import a list of all digits
  # Set numbers to display
  def initialize#(*args=ARGV)
    args = ARGV
    puts "args are"
    puts args.inspect
    size ||= 1
    numbers ||= []
    
    if args[0] == "-s" &&  args[1].integer? &&  args[1].floor > 0
      #puts "setting size"
      size = args[1].floor
      numbers = extract_digits(args[2])
    else 
      numbers = extract_digits(args[0])
    end
      
#      puts "Does not take in size variable yet"
#    else
    puts 'hello'
    puts numbers
#    @numbers ||= []
#    @numbers = number

    

#    end
  end

  def extract_digits arg
    arg.to_s.scan(/\d/)
  end

  def print
    puts @numbers
    puts BASE_LCD_DIGITS[0]
  end
end

if __FILE__ == $0
  a = Lcd.new
end
