

# A sequence of digits is printed by concatenating the lines of all digits (TODO: later implement concatenation from the top-down to support different sized digits)
DEFAULT_DIGIT_HEIGHT = 5
DEFAULT_DIGIT_WIDTH = 3
class Lcd
  # BASE_LCD_DIGITS = ["|"]
  
  # Import a list of all digits
  # Set numbers to display
  def initialize#(*args=ARGV)
    args = ARGV
    #puts "args are"
    #puts args.inspect
    @size ||= 1
    numbers ||= []
    
    #convert to strings


    if args[0] == "-s" &&  args[1].to_i.floor > 0
      #puts "setting @size"
      @size = args[1].to_i.floor
      extract_digits(args[2]) 
    else 
      @size = args[0].to_i
      extract_digits(args[0])
    end
  end

  def extract_digits arg
    @digits = arg.to_s.scan(/\d/).map{|i| i.to_i}
    raise Exception if @digits.empty? #TODO: Handle exception
  end

  # Collect each digit as an lcd representation
  # convert each line to be default width, by filling it with white space to that point.
  # combine each row of each digit
  def print_as_lcd
    
    # collect each digit in its lcd_representation
    @digits = @digits.collect{|digit| LcdDigit.lcd_representation(digit, @size)}
    
    lcd_digit_height = @size*2+3
    lcd_digit_width = @size+2

    lcd_output ||= Array.new(lcd_digit_height, "")
    @digits.each do |digit| 
      digit.each_with_index do |row,i|
        #puts "row " + i.to_s + " is:'"+ row.chomp + "'" #debugging
        lcd_output[i] = lcd_output[i] + 
          format("%-#{lcd_digit_width}s", row.chomp) + " "
      end
    end
    puts lcd_output#.inspect
  end

end





# Each digit is represented as an array of at least 5 lines.
# scale each digit to desired width
class LcdDigit
  UNKNOWN_DIGIT = Array.new(DEFAULT_DIGIT_HEIGHT, "?"*DEFAULT_DIGIT_WIDTH)
  HOR_CHAR = '-'
  VER_CHAR = '|'
  SPACE = ' ' 
  # In a file, search for the digit, then extract the next 5 lines, which represent the digit as a size one lcd object\
  # digit can't be "|" or "-"
  #FIXME: If digit isn't found, an error should be reported and the digit should be skipped
  def self.lcd_representation(digit, size=1)
    digit_in_lcd ||= []
    File.open('lcd_digits.txt', "r") do |f|
      begin
        until f.readline.match(/#{digit}/) do
          next# puts $_
        end
        digit_in_lcd = DEFAULT_DIGIT_HEIGHT.times.collect{ f.readline }
      rescue EOFError
        #STDERR.puts digit.to_s + " not found"
        #f.close
        digit_in_lcd = UNKNOWN_DIGIT.dup
      end
    end
    #puts "scaling #{digit} to size #{size}"
    scale(digit_in_lcd, size)
  end

  private
  
  # Scales a digit's lcd representation from size=1 to size
  def self.scale(digit_in_lcd, size)
    scaled_digit = []
    
    
    digit_in_lcd.each_with_index do |row, i|
      #      puts "row is '#{row}'"
      #stretch even rows (0,2,4) horizontally 
      if i%2 == 0
        #puts "row: '#{row.chomp}' scaled_row: '#{row.gsub(HOR_CHAR,HOR_CHAR*size).chomp}'"
        scaled_digit << row.gsub(HOR_CHAR,HOR_CHAR*size)
      #stretch odd rows vertically
      else
        row[1,1] = row[1,1]*size #FIXME: assumes width is 3
        row_sub =  row
        puts "row: '#{row}' scaled_row: '#{row_sub}'"
        size.times{scaled_digit << row_sub}
      end
      #puts "scaled digit, index #{i} so far is:" + scaled_digit.to_s #debugging
    end
    puts "scaled digit is:\n"+ scaled_digit.to_s
    return scaled_digit
  end

  # Return a block of '?' of appropriate size
  def unknown_digit(size)
  end 
end


if __FILE__ == $0
  a = Lcd.new
  a.print_as_lcd
end
