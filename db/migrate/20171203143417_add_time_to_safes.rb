class AddTimeToSafes < ActiveRecord::Migration
  def change
    add_column :saves, :time, :integer
    add_column :saves, :time_photo, :string
  end
end
