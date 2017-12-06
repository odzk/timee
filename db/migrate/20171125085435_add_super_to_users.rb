class AddSuperToUsers < ActiveRecord::Migration
  def change
    add_column :users, :super_admin, :string
  end
end
