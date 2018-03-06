class AddSkypeRequestCall < ActiveRecord::Migration
  def change
  	add_column :request_calls, :student_skype, :string
  end
end
