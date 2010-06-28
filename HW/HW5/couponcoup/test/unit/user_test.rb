require 'test_helper'

class UserTest < ActiveSupport::TestCase

  fixtures :users

  def setup 
    @coupon = Coupon.create(:company => "Bolt Bus",
                            :deal => "Buy 8 get 1 Free")
    assert @coupon.valid?
  end

  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "all users in fixture are valid" do
    invalid_users = User.all.reject{ |user| user.valid? }
    assert_equal 0, invalid_users.size
  end

  test "adding single coupon to a user" do

    User.first.coupons << @coupon
    assert_equal 1, User.first.coupons.size
  end

  test "adding many users to a coupon" do
    User.all.each do |user|
      @coupon.users << user
    end

    assert_equal @coupon.users.size, User.all.size
  end
end
