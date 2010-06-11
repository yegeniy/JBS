class AddProgressToCoupon < ActiveRecord::Migration
  def self.up
    add_column :coupons, :progress, :string
  end

  def self.down
    remove_column :coupons, :progress
  end
end
