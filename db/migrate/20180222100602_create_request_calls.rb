class CreateRequestCalls < ActiveRecord::Migration
  def change
    create_table :request_calls do |t|
      t.references :user, index: true, foreign_key: true
      t.string :teacher_name
      t.string :student_name
      t.timestamps null: false

    end
  end
end
