require 'test/unit'
require 'flexmock/test_unit'

module Exceptions
  class MissingWordException < StandardError; end
end

# Design a class to represent a dictionary
class Dictionary
  
# We know that the dictionary starts out empty
  def initialize
    @dictionary = {}
  end

# Don't know yet how I will represent info
  def empty?
    @dictionary.empty?
  end
  
  def add_translation(english, otherlanguage)
    @dictionary[otherlanguage] = english
  end
  
  def translate(otherlanguage)
    raise Exceptions::MissingWordException if @dictionary[otherlanguage].nil? #HW: Raises an exception
    @dictionary[otherlanguage]
  end

end

# Test the class as we develop it
class DictionaryTest < Test::Unit::TestCase
  
  def setup
    @dict = Dictionary.new
  end

# Check that a new dictionary is empty
  def test_empty_dict
    assert @dict .empty?
  end

# Check that once you add at least one translation it is not empty  
  def test_adding_xlate
    @dict.add_translation("book", "boek")
    assert !@dict.empty?
  end
  
# Check that I can fetch the translation I adde@dict.
  def test_add_fetch_xlate
    @dict.add_translation("book", "boek")
    book = @dict.translate("boek")
    assert_equal "book", book, "expected translation to be book"
  end
  
# Let's check two translations
  def test_add_two_xlates
    @dict.add_translation("book", "boek")
    @dict.add_translation("house", "huis")
    assert !@dict.empty?
    assert_equal "book", @dict.translate("boek")
    assert_equal "house", @dict.translate("huis")
  end

# Let's check that fetching a word that doesn't exist throws an exception
#  def test_fetch_missing_word
#    @dict.add_translation("book", "boek")
#    
#  end

# What if the dictionary is empty?
  def test_fetch_missing_word_from_empty_dictionary
    missing_word = "asdf"
    assert_raises Exceptions::MissingWordException do # HW: Checks for an exception!
      @dict.translate(missing_word)
    end
  end  
end

class MockDictionaryTest < Test::Unit::TestCase
  
  def test_the_truth
    assert true
  end


  def test_reverse_words
    dict = flex_Dictionary.new
    word_ru = "slova"
    word_en = "word"
    Dictionary.expects(:translate).with(word_ru).returns(word_en)
    assert_equal word_en, Dictionary.translate(word_ru)
  end
  
end
