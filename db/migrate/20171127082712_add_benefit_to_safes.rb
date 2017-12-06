class AddBenefitToSafes < ActiveRecord::Migration
  def change
    add_column :saves, :benefit, :integer
  end
end
