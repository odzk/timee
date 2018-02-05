class AddClassAndNotes < ActiveRecord::Migration
  def change
  	add_column :saves, :topic, :string
  	add_column :saves, :notes, :string
  end
end
