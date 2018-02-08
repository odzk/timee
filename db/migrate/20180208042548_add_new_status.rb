class AddNewStatus < ActiveRecord::Migration
  def change
  	add_column :users, :new, :boolean, default: true
  end
end
