require 'test_helper'
require 'rubygems'
require 'mocha'

class CouponTest < ActiveSupport::TestCase

  def setup 
    @coup = Coupon.new
  end
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "creating blank coupon" do
    @coup.save!
    assert @coup.valid?
  end

  test "creating a coupon with all fields filled" do
    @coup[:company] = "Bolt Bus"
    @coup[:deal] = "Buy 8 get 1 Free"
    @coup[:expiration] = Time.now
    @coup.save!
    assert @coup.valid?
#    @coup[:com
  end

  test "creating a coupon without an expiration date" do
    @coup[:company] = "Bolt Bus"
    @coup[:deal] = "Buy 8 get 1 Free"
    @coup.save!
    assert_nil @coup[:expiration] 
  end

#  test "" do
#
#  end



end
=begin
class MockCouponTest < Test::Unit::TestCase
  #TODO: Shouldn't be valid. Let's use a mock object for now.
  # Should be invalidity
  def test_creating_expired_coupon
    yesterday = DateTime.new.yesterday
    coup = Coupon.new(:expiration => yesterday)
    coup.expects(:valid?)
    
  end
end
=end
