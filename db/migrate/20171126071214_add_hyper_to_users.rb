class AddHyperToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hyper, :string
  end
end
