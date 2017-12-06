class AddEasyDateOfInputToToUsers < ActiveRecord::Migration
  def change
    add_column :saves, :easy_date_of_input, :string
  end
end
