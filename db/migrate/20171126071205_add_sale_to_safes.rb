class AddSaleToSafes < ActiveRecord::Migration
  def change
    add_column :saves, :sale_price, :integer
  end
end
