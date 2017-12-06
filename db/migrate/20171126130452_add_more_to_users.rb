class AddMoreToUsers < ActiveRecord::Migration
  def change
    add_column :saves, :photo2, :string
    add_column :saves, :photo3, :string
    add_column :saves, :paper1, :string, default: "false"
    add_column :saves, :paper2, :string, default: "false"
    add_column :saves, :paper3, :string, default: "false"
  end
end
