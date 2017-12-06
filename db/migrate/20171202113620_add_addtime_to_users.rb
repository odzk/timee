class AddAddtimeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :addtime, :integer
  end
end
