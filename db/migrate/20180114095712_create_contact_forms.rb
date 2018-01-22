class CreateContactForms < ActiveRecord::Migration
 
  drop_table(:contact_forms, if_exists: true)
 
  def change
    create_table :contact_forms do |t|
    	t.string :name
    	t.string :email
    	t.string :subject
    	t.text :message
      t.timestamps null: false
    end
  end
end
