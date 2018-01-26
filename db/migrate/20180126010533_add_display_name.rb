class AddDisplayName < ActiveRecord::Migration
  def change
  	add_column :users, :display_name, :integer
  end
end
