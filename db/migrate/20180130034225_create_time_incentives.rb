class CreateTimeIncentives < ActiveRecord::Migration
  def change
    create_table :time_incentives do |t|

      t.references :user, index: true, foreign_key: true
      t.string :teacher_name
      t.datetime :time_in
      t.datetime :time_out
      t.integer :total_earn

      t.timestamps null: false
    end
  end
end
