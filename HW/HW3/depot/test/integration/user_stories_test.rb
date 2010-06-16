require 'test_helper'

class UserStoriesTest < ActionController::IntegrationTest
  fixtures :products


  # A user goes to the store index page. 
  # They select a product, adding it to their cart. 
  # They then check out, filling in their details on the checkout form. 
  # When they submit,
  #   an order is created in the database containing their information,
  #   along with a single line item corresponding to the product they added to their cart.
  test "buying a product" do

    LineItem.delete_all
    Order.delete_all
    ruby_book = products(:ruby_book)

    # A user goes to the store index page. 
    get "/store/index"
    assert_response :success
    assert_template "index"

    # They select a product, adding it to their cart. 
    xml_http_request :put, "/store/add_to_cart", :id => ruby_book.id
    #TODO: PAGE 242
  end

  # Replace this with your real tests.
  test "the truth" do
    assert true
  end



end
