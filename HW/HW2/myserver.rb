######
# Ruby Client and Server, HW1
# Serve content between client and server
# Eugene Wolfson
# No preconditions
# type ruby myserver.rb at the prompt and then connect to localhost port 8888
######
require 'gserver'

FORTUNES = ["You will learn a lot", "You will get an 'A", "You still have much to learn, Grasshopper"]

JOKES = ["Two bytes meet. The first byte asks, \"Are you ill\" The second byte answers, \"No, I'm just a bit off\"", "Knock! Knock!\nWho's there?\n...\n...\n... Java", "The generation of random numbers is too important to be left to chance.", "One hundred little bugs in the code\nOne hundred little bugs.\nFix a bug, link the fix in,\nOne hundred little bugs in the code."]

# A sub class of GServer which is able to serve content to clients based on their io_object 
class MyServer < GServer
  # Constructs a GServer with the array *args (e.g. a single port number) 
  # Initializes the client_id to 0
  def initialize(*args)
    super(*args)    
    @@client_id = 0
  end
  
  # Iterates the client id, and serves (through its) io_object with a response based on the content of io_object
  def serve(io_object)
    @@client_id += 1 # Adds 1 to the current value of @@client_id, so that the minum displayed client id is 1.
    my_client_id = @@client_id
    io_object.sync = true
    
    puts("Client #{@@client_id} attached.")
    loop do
      #puts "about to readline" #debugging
      line = io_object.readline.chomp
      #puts "read line"#debugging
     
      case line
      when /^time/       # Time: H:M:S with meridian
        io_object.puts "The time is #{Time.now.strftime("%I:%M:%S%p")}"
      when /^t/         # Time and date
        io_object.puts "The time of day is #{Time.now}"
      when /^x/         # Stop serving client
        puts "Exiting!"
        break
      when /^f/         # Serve random fortune
        puts "serving random fortune"#debugging
        puts sample1(FORTUNES)
        io_object.puts sample1 FORTUNES # FORTUNES[FORTUNES.length * rand]
      when /^date/       # Serve Date
        io_object.puts "The date is #{Time.now.strftime("%a %B %d %Y")}"
      when /^d/         # Serve file
        puts filename = line.match(/[^d]+/).to_s
        if File.exist?(filename) 
          io_object.puts File.new(filename, "r").read
        else 
          io_object.puts "File #{filename} not found"
        end
          
        puts "#{filename} contesnts passsed in"
          
        # this serves the contents of the file. If the content happens to be HTML, a browser could render it like any other request... except the request should be interpreted by a protocol.
      when /^message\//   # Serve a message supported in the Message class
        Message.new(line)
      else
        puts "received line #{line}"
        io_object.put "What does #{line} mean anyway?"
      end

    end
  end
end

# Parses and chooses a message of the format message/TYPE?OPTION_TYPE=OPTION
#       where message/ is assumed, 
#       TYPE is a type of message to return (joke, or fortune)
#       OPTION_TYPE is an optional modifier (like language to use for the message)
#       OPTION is the choise for the modifier (such as en for English, or ru for Russian)
class Message

  # a regex applied to a single line which is assumed to start with "message/"
  # returns an appropriate message
  def initialize(line)
    matches = /^message\/ ([^\?\s]+) ((\?lang=) (.+))?/x.match(line) #FIXME: comment and expand into several lines

    message_type= matches[1]
    option_type = /[^\?=]+/.match(matches[2]) #TODO: not implemented
    option = matches[3] #TODO: Not implemented
    
    case message_type
    when /^joke/
      choose_message(JOKES, option)
    when /^fortune/
      choose_message(FORTUNES, option)
    end
    
  end


  # Returns a random message from the given list and option set.
  def choose_message(list, option)
    case option
    when nil || "en"
      sample1 list
    else
      "#{option} is not a supported language."
    end
  end
  
end

#returns a single random element of list
def sample1 list 
  list[list.length * rand]
end

puts "Starting to listen for a connection on port 8888"
server = MyServer.new(8888) # Starts a new GServer subclass on localhost port 8888 with the ability to serve content as defined in MyServer.serve
server.start
server.join
