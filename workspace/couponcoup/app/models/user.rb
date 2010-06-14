class User < ActiveRecord::Base
  has_many :coupons
end
