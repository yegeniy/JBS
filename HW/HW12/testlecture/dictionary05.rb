require 'test/unit'
require 'rubygems'
require 'mocha'

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
# This mocks functionality of dictionary which is still not implemented. For instance, translating words from non-english, back to english, not the other way
class MockDictionaryTest < Test::Unit::TestCase
  
  def test_the_truth
    assert true
  end

  # You see, the reverse translate method doesn't actually exist, but that's where mock comes in!
  # test_mocking_an_instance_method_on_a_real_object
  def test_reverse_translate
    dict = Dictionary.new
    word_ru = "slova"
    word_en = "word"
    dict.expects(:reverse_translate).with(word_ru).returns(word_en)
    assert_equal word_en, dict.reverse_translate(word_ru)
  end
  
end
