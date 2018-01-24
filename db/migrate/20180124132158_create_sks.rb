class CreateSks < ActiveRecord::Migration
  def change
    create_table :sks do |t|
    	t.string :sk, :limit => 1000
    	t.string :pk, :limit => 1000
      t.timestamps null: false
    end
  end
end
