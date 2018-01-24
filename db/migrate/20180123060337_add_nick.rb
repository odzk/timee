class AddNick < ActiveRecord::Migration
  def change
  	   add_column :users, :nick, :string
  end
end
