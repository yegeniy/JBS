puts "Test 1"
t1 = Lcd.new 0123456789
t1.print

puts "Test 2"
t2 = Lcd.new -s 1 0123456789
t2.print
t2.change_size 3
t2.print

puts "Test 3"
t3 = Lcd.new -s 3 0123456789
t3.print
t3.change_size 1
t3.print
