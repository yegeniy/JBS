require 'rubygems'
require 'httparty'

class CardUtil
  include HTTParty
  base_uri 'localhost:3000'
  
  # add a new card. Optionally add two phone records with two phone numbers 
  def add(name, *args)
#    puts "the home number is " +args[0]
    home_number = args[0]
    office_number = args[1]
    options = {:body => {:card => 
        { :name => name, 
          :home_phone => home_number,
          :office_phone => office_number}}}
    self.class.post("/cards.xml",options) #:action => "create"
  end

  # delete existing card 
  def delete(name)
    self.class.delete("/cards/#{name}.xml")
  end

  
  def update_card(cardnum, text)
    options = {:query => {:card => {:name => text}}}
    self.class.get("/cards/#{cardnum}/store.xml", options)
  end

end


#cu = CardUtil.new
#cu.update_card(ARGV[0], ARGV[1])
