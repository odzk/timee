class AddRequestCallStatus < ActiveRecord::Migration
  def change
  	add_column :request_calls, :status, :string
  	add_column :request_calls, :notes, :string
  end
end
