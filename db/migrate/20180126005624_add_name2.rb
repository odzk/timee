class AddName2 < ActiveRecord::Migration
  def change
  	 add_column :users, :name2, :string
  end
end
