class AddEasyDateOfOutputToSafes < ActiveRecord::Migration
  def change
    add_column :saves, :easy_date_of_output, :string
  end
end
