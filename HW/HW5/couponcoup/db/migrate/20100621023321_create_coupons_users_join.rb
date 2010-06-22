class CreateCouponsUsersJoin < ActiveRecord::Migration
  def self.up
    create_table 'coupons_users', :id => false do |t|
      t.column 'coupon_id', :integer
      t.column 'user_id', :integer
    end
  end

  def self.down
    drop_table 'coupons_users'
  end
end
