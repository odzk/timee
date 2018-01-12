class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|

      t.references :user, index: true, foreign_key: true
      t.string :transaction
      t.integer :mins
      t.datetime :datetime
      t.string :teacher

      t.timestamps null: false
    end
  end
end
