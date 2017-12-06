class AddIroiroToSafes < ActiveRecord::Migration
  def change
    add_column :saves, :student, :string
    add_column :saves, :teacher, :string
    add_column :saves, :status_teacher, :string
  end
end
