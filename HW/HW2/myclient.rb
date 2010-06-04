######
# Ruby Client and Server, HW1
# Serve content between client and server
# Eugene Wolfson
# No preconditions
# ruby myclient.rb at the prompt after starting myserver.rb in a 
######

require 'socket'

tcp_socket = TCPSocket.open('0.0.0.0', 8888)

puts 'x to exit'
loop do
  # Send one line of input from stdin through the tcp_socket 
  #  to a (hopefully listening server at localhost port 8888
  print "> "
  command_string = gets.chomp
  break if command_string =~ /x/ #exit command starts with x
  tcp_socket.puts command_string
  servers_resp = tcp_socket.readline
  puts servers_resp.to_s
end

