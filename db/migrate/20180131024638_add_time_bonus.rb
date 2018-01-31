class AddTimeBonus < ActiveRecord::Migration
  def change
  	 add_column :time_incentives, :time_in_bonus, :datetime
  end
end
