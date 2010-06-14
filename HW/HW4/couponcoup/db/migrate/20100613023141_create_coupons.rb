class CreateCoupons < ActiveRecord::Migration
  def self.up
    create_table :coupons do |t|
      t.string :company
      t.string :deal
      t.datetime :expiration

      t.timestamps
    end
  end

  def self.down
    drop_table :coupons
  end
end
