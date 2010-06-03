######
# Exercise 3, HW1
# Runs a TCP server on port 888, which displays a fortune cookie to clients connecting to the server.
# Eugene Wolfson
# No preconditions
# At the prompt in the containing folder enter:
#  > ruby exercise2.rb 
######

require 'socket'               # Get sockets from stdlib
require 'exercise2'            # Get Fortune class

server = TCPServer.open(8888)  # Socket to listen on port 2000
loop {                         # Servers run forever
  client = server.accept       # Wait for a client to connect
  p "client #{client} connected"#debugging
  
  #Send 1 unique fortunes
  f = Fortune.new
  #1.times do 
    client.puts(f.next_fortune!) 
  #end

  client.puts "Closing the connection. Bye!"
  client.close                 # Disconnect from the client
  p "client #{client} disconnected"
}
