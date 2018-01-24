class AddSafesReferences < ActiveRecord::Migration
  def change
  change_table :saves do |t|
  t.references :user, index: true, foreign_key: true
end
  end
end
