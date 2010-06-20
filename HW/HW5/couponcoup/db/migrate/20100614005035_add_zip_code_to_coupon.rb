class AddZipCodeToCoupon < ActiveRecord::Migration
  def self.up
    add_column :coupons, :zip_code, :string
  end

  def self.down
    remove_column :coupons, :zip_code
  end
end
