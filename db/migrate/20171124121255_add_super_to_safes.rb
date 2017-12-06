class AddSuperToSafes < ActiveRecord::Migration
  def change
    add_column :saves, :super_admin, :string
  end
end
