class AddIroiro3ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :busy, :string
  end
end
