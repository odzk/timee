class AddIroiro2ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :picture, :string
    add_column :users, :picture2, :string
    add_column :users, :picture3, :string
    add_column :users, :skill, :string
    add_column :users, :job, :string
    add_column :users, :appeal, :string
    add_column :users, :hobby, :string
    add_column :users, :country, :string
    add_column :users, :movie, :string
  end
end
