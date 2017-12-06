class AddIroiroToUsers < ActiveRecord::Migration
  def change
    add_column :users, :time, :integer
    add_column :users, :type_user, :string
    add_column :users, :skype, :string
  end
end
