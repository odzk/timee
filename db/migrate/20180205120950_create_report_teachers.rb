class CreateReportTeachers < ActiveRecord::Migration
  def change
    create_table :report_teachers do |t|

      t.references :user, index: true, foreign_key: true
      t.string :teacher_name
      t.string :student_name
      t.string :incident_name
      
      t.timestamps null: false
    end
  end
end
